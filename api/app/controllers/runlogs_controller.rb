class RunlogsController < ApplicationController
  before_action :set_runlog, only: %i[ show update destroy ]

  # GET /runlogs
  def index
    @runlogs = Runlog.all

    render json: @runlogs
  end

  # GET /runlogs/1
  def show
    render json: @runlog
  end

  # POST /runlogs
  def create
    @runlog = Runlog.new(runlog_params)

    if @runlog.save
      render json: @runlog, status: :created, location: @runlog
    else
      render json: @runlog.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /runlogs/1
  def update
    if @runlog.update(runlog_params)
      render json: @runlog
    else
      render json: @runlog.errors, status: :unprocessable_entity
    end
  end

  # DELETE /runlogs/1
  def destroy
    @runlog.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_runlog
      @runlog = Runlog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def runlog_params
      params.require(:runlog).permit(:running_date, :distance, :kcal, :time, :average_heart_beat, :max_heart_beat, :aerobic_te, :average_pitch, :high_pitch, :average_pace, :high_pace, :total, :lift, :total_descent, :average_stride_length, :average_vertical_ratio, :average_vertical, :average_contact_time, :average_gct_balance, :average_power, :max_power, :grid, :flow, :average_swolf, :average_stalk_rate, :number_of_reps, :dive_time, :lowest_temp, :surface_rest, :decompression, :best_lap_time, :lap_count, :highest_temp, :travel_time, :elapsed_time, :minimum_altitude, :maximum_altitude, :place, :start_time)
    end
end
