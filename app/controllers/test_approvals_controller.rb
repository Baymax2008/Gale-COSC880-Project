class TestApprovalsController < ApplicationController
  before_action :set_test_approval, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /test_approvals
  # GET /test_approvals.json
  def index
    @test_approvals = TestApproval.all
  end

  # GET /test_approvals/1
  # GET /test_approvals/1.json
  def show
  end

  # GET /test_approvals/new
  def new
    @test_approval = TestApproval.new
  end

  # GET /test_approvals/1/edit
  def edit
  end

  # POST /test_approvals
  # POST /test_approvals.json
  def create
    @test_approval = TestApproval.new(test_approval_params)

    respond_to do |format|
      if @test_approval.save
        format.html { redirect_to @test_approval, notice: 'Test approval was successfully created.' }
        format.json { render :show, status: :created, location: @test_approval }
      else
        format.html { render :new }
        format.json { render json: @test_approval.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_approvals/1
  # PATCH/PUT /test_approvals/1.json
  def update
    @test = @test_approval.test
    respond_to do |format|
      if @test_approval.update(test_approval_params)

        #Sending E-mails
        if @test_approval.approved?
          TestMailer.test_approved(@test).deliver_now
        end

        format.html { redirect_to @test_approval, notice: 'Test approval was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_approval }
      else
        format.html { render :edit }
        format.json { render json: @test_approval.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_approvals/1
  # DELETE /test_approvals/1.json
  def destroy
    @test_approval.destroy
    respond_to do |format|
      format.html { redirect_to test_approvals_url, notice: 'Test approval was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_approval
      @test_approval = TestApproval.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_approval_params
      params.require(:test_approval).permit(:approved, :test_id)
      #params.fetch(:test_approval, {})
    end
end
