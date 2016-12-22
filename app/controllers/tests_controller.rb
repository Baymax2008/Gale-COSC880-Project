class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /tests
  # GET /tests.json
  def index
    @tests = Test.all
    @approvel = TestApproval.all
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
    @test = Test.find(params[:id])
    @encrypters = @test.encrypters
    @routers = @test.routers
    #@approvel = TestApproval.find_by_test_id(params[:id])
  end

  # GET /tests/new
  def new
    @test = Test.new
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  # POST /tests.json
  def create
    @test = Test.new(test_params)
    respond_to do |format|
      if @test.save

        #This is creating a testApproval entry
        @s = TestApproval.new(
          test_id:  @test.id,
          approved: false
        )
        @s.save!

        #This is sending out an e-mail to the admins
        TestMailer.test_request(@test).deliver_now

        format.html { redirect_to @test, notice: 'Test was successfully created.' }
        format.json { render :show, status: :created, location: @test }

      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    authorize! :update, @test
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    authorize! :destroy, @test
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:name, :start_date, :end_date, :allLabMoA, :testProcedures,
                                   :testNum, :network_id, :system_id)

    end

end