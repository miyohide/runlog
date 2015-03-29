class GarminLogsController < ApplicationController
  def new
    @garmin_log = GarminLog.new
  end

  def create
    GarminLog.create(garmin_log_params)
    redirect_to root_path
  end

  private
  def garmin_log_params
    params.require(:garmin_log).permit(:csv_file)
  end
end

