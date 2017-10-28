class SearchesController < ApplicationController
  
  def show
  # render text: params
    # render :result
    # result
    if params[:search]
      start_station_id = params[:search][:start_station_id]
      end_station_id = params[:search][:end_station_id]
      @start_station = RailwayStation.find(start_station_id)
      @end_station = RailwayStation.find(end_station_id)
      @routes_trains = Search.run_search(start_station_id, end_station_id)
      render :result
    else
      @stations = RailwayStation.all 
    end
    
  end
  
  def new
      # @stations = RailwayStation.all 
      #form
  end
  
  def create
    # render text: params
    # @search = Search.new(search_params)
    # start_station_id = params[:search][:start_station_id]
    # end_station_id = params[:search][:end_station_id]
    # @start_station = RailwayStation.find(start_station_id)
    # @end_station = RailwayStation.find(end_station_id)
    # @routes_trains = Search.run_search(start_station_id, end_station_id)
    
  end
  
  private
  
  def search_params
    params.require(:search).permit(:start_station_id, :end_station_id)
  end
end