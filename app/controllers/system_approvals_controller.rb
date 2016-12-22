class SystemApprovalsController < ApplicationController
  before_action :set_system_approval, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @system_approvals = SystemApproval.all
  end

  def show

  end

  def new
    @system_approval = SystemApproval.new
  end

  def edit

  end

  def create
    @system_approval = SystemApproval.new(system_approval_params)

    respond_to do |format|
      if @system_approval.save
        format.html { redirect_to @system_approval, notice: 'System approval was successfully created.' }
        format.json { render :show, status: :created, location: @system_approval }
      else
        format.html { render :new }
        format.json { render json: @system_approval.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    @system = @system_approval.system

    respond_to do |format|
      if @system_approval.update(system_approval_params)

        #Sending E-mails
        if ( @system_approval.iaApproved? && !@system_approval.aiEmail? )
          SystemMailer.system_iaApproved(@system).deliver_now
          @system_approval.aiEmail = true
          @system_approval.save
        end

        if ( @system_approval.atoApproved? && !@system_approval.atoEmail? )
          SystemMailer.system_atoApproved(@system).deliver_now
          @system_approval.atoEmail = true
          @system_approval.save
        end

        format.html { redirect_to @system_approval, notice: 'System approval was successfully updated.' }
        format.json { render :show, status: :ok, location: @system_approval }
      else
        format.html { render :edit }
        format.json { render json: @system_approval.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @system_approval.destroy
    respond_to do |format|
      format.html { redirect_to system_approvals_url, notice: 'System approval was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_system_approval
    @system_approval = SystemApproval.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def system_approval_params
    params.require(:system_approval).permit(:iaApproved, :atoApproved, :system_id)
    #params.fetch(:system_approval, {})
  end

end
