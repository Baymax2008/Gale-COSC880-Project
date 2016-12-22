class LabApprovalsController < ApplicationController
  before_action :set_lab_approval, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @lab_approvals = LabApproval.all
    @user = User.all
  end

  def show

  end

  def new
    @lab_approval = LabApproval.new
  end

  def edit

  end

  def create
    @lab_approval = LabApproval.new(lab_approval_params)

    respond_to do |format|
      if @lab_approval.save
        format.html { redirect_to @lab_approval, notice: 'Lab approval was successfully created.' }
        format.json { render :show, status: :created, location: @lab_approval }
      else
        format.html { render :new }
        format.json { render json: @lab_approval.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    @lab = @lab_approval.lab

    respond_to do |format|
      if @lab_approval.update(lab_approval_params)

        #Sending E-mails
        if ( @lab_approval.approved?  )
          LabMailer.lab_approved(@lab).deliver_now
        end

        format.html { redirect_to @lab_approval, notice: 'Lab approval was successfully updated.' }
        format.json { render :show, status: :ok, location: @lab_approval }
      else
        format.html { render :edit }
        format.json { render json: @lab_approval.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lab_approval.destroy
    respond_to do |format|
      format.html { redirect_to lab_approvals_url, notice: 'Lab approval was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_lab_approval
    @lab_approval = LabApproval.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def lab_approval_params
    params.require(:lab_approval).permit(:approved, :lab_id)
    #params.fetch(:lab_approval, {})
  end

end