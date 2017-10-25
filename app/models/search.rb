class Search < ActiveRecord::Base  
  def self.run_search(start_station_id, end_station_id)
    # select r.name, train.number from routes as r
    #  join railway_stations_routes as rsr
    #  on r.id = rsr.route.id 
    #  join railway_stations as s
    #  on s.id = rsr.railway_station_id
    #  join trains as t
    #  on t.route_id = r.id
    #  where s.id = 1 and s.id =11
    # NOTE: try to use pluck instead of select in future
    
    Route.joins([{railway_stations_routes: :railway_station}, :trains]).select('routes.id as route_id, routes.name as route_name, trains.number as train_number').where(railway_stations: {id: start_station_id}).where(railway_stations: {id: end_station_id})
  end 
end



# SELECT  routes.id as route_id, routes.name as route_name, trains.number as train_number FROM "routes" INNER JOIN "railway_stations_routes" ON "railway_stations_routes"."route_id" = "routes"."id" INNER JOIN "railway_stations" ON "railway_stations"."id" = "railway_stations_routes"."railway_station_id" INNER JOIN "trains" ON "trains"."route_id" = "routes"."id" WHERE "railway_stations"."id" = ? AND "railway_stations"."id" = ?