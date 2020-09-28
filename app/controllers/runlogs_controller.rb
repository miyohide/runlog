class RunlogsController < ApplicationController
  before_action :set_runlog, only: [:show, :edit, :update, :destroy]

  # GET /runlogs
  # GET /runlogs.json
  def index
    @runlogs = Runlog.all
  end

  # GET /runlogs/1
  # GET /runlogs/1.json
  def show
  end

  # GET /runlogs/new
  def new
    @runlog = Runlog.new
  end

  # GET /runlogs/1/edit
  def edit
  end

  # POST /runlogs
  # POST /runlogs.json
  def create
    @runlog = Runlog.new(runlog_params)

    respond_to do |format|
      if @runlog.save
        format.html { redirect_to @runlog, notice: 'Runlog was successfully created.' }
        format.json { render :show, status: :created, location: @runlog }
      else
        format.html { render :new }
        format.json { render json: @runlog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /runlogs/1
  # PATCH/PUT /runlogs/1.json
  def update
    respond_to do |format|
      if @runlog.update(runlog_params)
        format.html { redirect_to @runlog, notice: 'Runlog was successfully updated.' }
        format.json { render :show, status: :ok, location: @runlog }
      else
        format.html { render :edit }
        format.json { render json: @runlog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /runlogs/1
  # DELETE /runlogs/1.json
  def destroy
    @runlog.destroy
    respond_to do |format|
      format.html { redirect_to runlogs_url, notice: 'Runlog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_runlog
      @runlog = Runlog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def runlog_params
      params.require(:runlog).permit(:run_date, :distance, :total_time_hours, :total_time_minutes, :total_time_seconds)
    end
end
