class Admin::RailwayStationsController < Admin::BaseController
  before_action :set_railway_station, only: %i[show edit update destroy update_serial_number update_time_departure update_time_arrival]
  
  before_action :set_route, only: %i[update_serial_number update_time_departure update_time_arrival]
  
  # GET /railway_stations
  def index
    @railway_stations = RailwayStation.all
  end

  # GET /railway_stations/1
  def show; end

  # GET /railway_stations/new
  def new
    @railway_station = RailwayStation.new
  end

  # GET /railway_stations/1/edit
  def edit; end

  # POST /railway_stations
  def create
    @railway_station = RailwayStation.new(railway_station_params)

    respond_to do |format|
      if @railway_station.save
        format.html { redirect_to @railway_station, notice: 'Railway station was successfully created.' }
        format.json { render :show, status: :created, location: @railway_station }
      else
        format.html { render :new }
        format.json { render json: @railway_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /railway_stations/1
  def update
    respond_to do |format|
      if @railway_station.update(railway_station_params)
        format.html { redirect_to @railway_station, notice: 'Railway station was successfully updated.' }
        format.json { render :show, status: :ok, location: @railway_station }
      else
        format.html { render :edit }
      end
    end
  end
  
  def update_serial_number
    @railway_station.update_serial_number(route: @route, position: params[:station_serial_number])
    redirect_to @route
  end
  
  def update_time_departure
    @railway_station.update_time_departure(time: params[:time_departure], route: @route)
    redirect_to @route
  end
  
  def update_time_arrival
    @railway_station.update_time_arrival(time: params[:time_arrival], route: @route)
    redirect_to @route
  end

  # DELETE /railway_stations/1
  def destroy
    @railway_station.destroy
    respond_to do |format|
      format.html { redirect_to railway_stations_url, notice: 'Railway station was successfully destroyed.' }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_railway_station
    @railway_station = RailwayStation.find(params[:id])
  end
  
  def set_route
    @route = Route.find(params[:route_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def railway_station_params
    params.require(:railway_station).permit(:title)
  end
end
