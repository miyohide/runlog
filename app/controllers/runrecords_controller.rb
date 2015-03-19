class RunrecordsController < ApplicationController
  before_action :set_runrecord, only: [:show, :edit, :update]

  # GET /runrecords
  # GET /runrecords.json
  def index
    @runrecords = Runrecord.order(runned_at: :desc).page params[:page]
    gon.runrecords = distance_map(@runrecords)
  end

  # GET /runrecords/1
  # GET /runrecords/1.json
  def show
  end

  # GET /runrecords/new
  def new
    @runrecord = Runrecord.new
  end

  # GET /runrecords/1/edit
  def edit
  end

  # POST /runrecords
  # POST /runrecords.json
  def create
    @runrecord = Runrecord.new(runrecord_params)

    respond_to do |format|
      if @runrecord.save
        format.html { redirect_to @runrecord, notice: 'Runrecord was successfully created.' }
        format.json { render :show, status: :created, location: @runrecord }
      else
        format.html { render :new }
        format.json { render json: @runrecord.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /runrecords/1
  # PATCH/PUT /runrecords/1.json
  def update
    respond_to do |format|
      if @runrecord.update(runrecord_params)
        format.html { redirect_to @runrecord, notice: 'Runrecord was successfully updated.' }
        format.json { render :show, status: :ok, location: @runrecord }
      else
        format.html { render :edit }
        format.json { render json: @runrecord.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_runrecord
      @runrecord = Runrecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def runrecord_params
      params.require(:runrecord).permit(:runned_at, :distance, :run_time)
    end

    def distance_map(runrecords)
      runrecords.map { |r| { runned_at: r.runned_at.utc_to_ja, distance: r.distance } }
    end
end
