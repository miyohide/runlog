class RunrecordsController < ApplicationController
  before_action :set_runrecord, only: %i[ show edit update destroy ]

  # GET /runrecords or /runrecords.json
  def index
    @runrecords = Runrecord.all
  end

  # GET /runrecords/1 or /runrecords/1.json
  def show
  end

  # GET /runrecords/new
  def new
    @runrecord = Runrecord.new
  end

  # GET /runrecords/1/edit
  def edit
  end

  # POST /runrecords or /runrecords.json
  def create
    @runrecord = Runrecord.new(runrecord_params)

    respond_to do |format|
      if @runrecord.save
        format.html { redirect_to @runrecord, notice: "Runrecord was successfully created." }
        format.json { render :show, status: :created, location: @runrecord }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @runrecord.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /runrecords/1 or /runrecords/1.json
  def update
    respond_to do |format|
      if @runrecord.update(runrecord_params)
        format.html { redirect_to @runrecord, notice: "Runrecord was successfully updated." }
        format.json { render :show, status: :ok, location: @runrecord }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @runrecord.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /runrecords/1 or /runrecords/1.json
  def destroy
    @runrecord.destroy
    respond_to do |format|
      format.html { redirect_to runrecords_url, notice: "Runrecord was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_runrecord
      @runrecord = Runrecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def runrecord_params
      params.require(:runrecord).permit(:starttime, :distance, :runtime)
    end
end
