class RunrecordsController < ApplicationController
  before_action :set_runrecord, only: [:show, :edit, :update]

  def index
    @runrecords = policy_scope(Runrecord).page params[:page]
    # @runrecords = Runrecord.order(runned_at: :desc).page params[:page]
    @garmin_log = GarminLog.new
    gon.runrecords = distance_map(@runrecords)
    gon.pace_records = pace_map(@runrecords)
  end

  def show
  end

  def new
    @runrecord = Runrecord.new
  end

  def edit
  end

  def create
    @runrecord = Runrecord.new(runrecord_params)

    if @runrecord.save
      redirect_to @runrecord, notice: 'Runrecord was successfully created.'
    else
      render :new
    end
  end

  def update
    runned_at_utc = Time.parse(runrecord_params[:runned_at]).utc
    if @runrecord.update(runrecord_params.update({runned_at: runned_at_utc}))
      redirect_to @runrecord, notice: 'Runrecord was successfully updated.'
    else
      render :edit
    end
  end

  private
    def set_runrecord
      @runrecord = Runrecord.find(params[:id])
    end

    def runrecord_params
      params.require(:runrecord).permit(:runned_at, :distance, :run_time)
    end

    def distance_map(runrecords)
      runrecords.map do |r|
        { runned_at: I18n.localize(r.runned_at.utc_to_ja), distance: r.distance }
      end
    end

    def pace_map(runrecords)
      runrecords.map do |r|
        { runned_at: I18n.localize(r.runned_at.utc_to_ja), pace: r.pace }
      end
    end
end
