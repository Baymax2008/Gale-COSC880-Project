class LabsController < ApplicationController
  before_action :set_lab, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /labs
  # GET /labs.json
  def index
    @labs = Lab.all
    @user = User.all
    #@current_user = current_user
  end

  # GET /labs/1
  # GET /labs/1.json
  def show
    @approvel = LabApproval.find_by_lab_id(params[:id])
    @mgr = User.find(@lab.mgr_id)
  end

  # GET /labs/new
  def new
    @lab = Lab.new
  end

  # GET /labs/1/edit
  def edit
  end

  # POST /labs
  # POST /labs.json
  def create

    @lab = Lab.new(lab_params)
    @lab.mgr_id = current_user.id


    respond_to do |format|
      if @lab.save
        @user = current_user
        @user.lab_id = @lab.id
        @user.save

        #This is creating a testApproval entry
        @temp = LabApproval.new(
            lab_id:    @lab.id,
            approved:   false,
        )
        @temp.save!

        #This is sending out an e-mail to the admins
        LabMailer.lab_request(@lab).deliver_now

        format.html { redirect_to @lab, notice: 'Lab was successfully created.' }
        format.json { render :show, status: :created, location: @lab }
      else
        format.html { render :new }
        format.json { render json: @lab.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /labs/1
  # PATCH/PUT /labs/1.json
  def update
    authorize! :update, @lab
    respond_to do |format|
      if @lab.update(lab_params)
        format.html { redirect_to @lab, notice: 'Lab was successfully updated.' }
        format.json { render :show, status: :ok, location: @lab }
      else
        format.html { render :edit }
        format.json { render json: @lab.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labs/1
  # DELETE /labs/1.json
  def destroy
    authorize! :destroy, @lab
    @lab.destroy
    respond_to do |format|
      format.html { redirect_to labs_url, notice: 'Lab was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lab
      @lab = Lab.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lab_params
      params.require(:lab).permit(:name, :accrediation, :accredDate, :loa, :loa_Approval, :loa_Expiration, :mgr_id)
    end
end
