class GarminLogsController < ApplicationController
  def new
    @garmin_log = GarminLog.new
  end

  def create
    garmin_log = GarminLog.create(garmin_log_params)

    Runrecord.save_logs(garmin_log.parse_csv)
    redirect_to root_path
  end

  private
  def garmin_log_params
    params.require(:garmin_log).permit(:csv_file)
  end
end

