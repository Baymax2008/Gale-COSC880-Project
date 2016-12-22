class SystemsController < ApplicationController
  before_action :set_system, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /systems
  # GET /systems.json
  def index
    @systems = System.all
  end

  # GET /systems/1
  # GET /systems/1.json
  def show
    @approvel = SystemApproval.find_by_system_id(params[:id])
  end

  # GET /systems/new
  def new
    @system = System.new
  end

  # GET /systems/1/edit
  def edit
  end

  # POST /systems
  # POST /systems.json
  def create
    @system = System.new(system_params)
    @system.lab_id = current_user.lab_id

    respond_to do |format|
      if @system.save

        #This is creating a testApproval entry
        @temp = SystemApproval.new(
            system_id:    @system.id,
            iaApproved:   false,
            atoApproved:  false
        )
        @temp.save!

        #This is sending out an e-mail to the admins
        SystemMailer.system_request(@system).deliver_now

        format.html { redirect_to @system, notice: 'System was successfully created.' }
        format.json { render :show, status: :created, location: @system }
      else
        format.html { render :new }
        format.json { render json: @system.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /systems/1
  # PATCH/PUT /systems/1.json
  def update
    authorize! :update, @system
    respond_to do |format|
      if @system.update(system_params)

        if @system.atoDoc_updated_at < Time.now && @system.atoDoc_updated_at > Time.now - 2
          SystemMailer.system_added_ato(@system).deliver_now
        end
        format.html { redirect_to @system, notice: 'System was successfully updated.' }
        format.json { render :show, status: :ok, location: @system }
      else
        format.html { render :edit }
        format.json { render json: @system.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /systems/1
  # DELETE /systems/1.json
  def destroy
    authorize! :destroy, @system
    @system.destroy
    respond_to do |format|
      format.html { redirect_to systems_url, notice: 'System was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_system
      @system = System.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def system_params
      params.require(:system).permit(:name, :ato_Expiration, :atoDoc)
    end
end
