
class SearchesController < ApplicationController
  def show
    if params[:search]
      start_station_id, end_station_id = search_params.values_at(:start_station_id, :end_station_id)
      @start_station = RailwayStation.find(start_station_id)
      @end_station = RailwayStation.find(end_station_id)
      @routes_trains = Search.run_search(start_station_id, end_station_id)
      render :result
    else
      @stations = RailwayStation.all 
    end
  end

  private
  
  def search_params
    params.require(:search).permit(:start_station_id, :end_station_id)
  end
end
