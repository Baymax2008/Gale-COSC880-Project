class EncryptersController < ApplicationController
  before_action :set_encrypter, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /encrypters
  # GET /encrypters.json
  def index
    @encrypters = Encrypter.all
  end

  # GET /encrypters/1
  # GET /encrypters/1.json
  def show
  end

  # GET /encrypters/new
  def new
    @encrypter = Encrypter.new
  end

  # GET /encrypters/1/edit
  def edit
  end

  # POST /encrypters
  # POST /encrypters.json
  def create
    @encrypter = Encrypter.new(encrypter_params)

    respond_to do |format|
      if @encrypter.save
        format.html { redirect_to @encrypter, notice: 'Encrypter was successfully created.' }
        format.json { render :show, status: :created, location: @encrypter }
      else
        format.html { render :new }
        format.json { render json: @encrypter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /encrypters/1
  # PATCH/PUT /encrypters/1.json
  def update
    respond_to do |format|
      if @encrypter.update(encrypter_params)
        format.html { redirect_to @encrypter, notice: 'Encrypter was successfully updated.' }
        format.json { render :show, status: :ok, location: @encrypter }
      else
        format.html { render :edit }
        format.json { render json: @encrypter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /encrypters/1
  # DELETE /encrypters/1.json
  def destroy
    @encrypter.destroy
    respond_to do |format|
      format.html { redirect_to encrypters_url, notice: 'Encrypter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_encrypter
      @encrypter = Encrypter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def encrypter_params
      params.require(:encrypter).permit(:serialNum, :description, :speed, :expiration, :test_id)
    end
end
