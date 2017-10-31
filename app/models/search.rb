class Search
  def self.run_search(start_station_id, end_station_id)
    Train.includes(route: :railway_stations).where(railway_stations: { id: start_station_id }) &
    Train.includes(route: :railway_stations).where(railway_stations: { id: end_station_id })    
  end 
end



