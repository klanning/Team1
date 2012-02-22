require './drive_route'


origin = "address"
destination = "address"

drive_route = DriveRoute.new(origin,destination)
public_transportation_route = PublicRoute.new(origin,destination)
 check if origin is bart station, call bart_route(origin, destination)
 check if destination is bart station call bart_route(origin, destination)
 
 otherwise
 
 call walk_route(origin, closest_bart_station)
 call bart_route(closest_bart_station_to_origin,closest_bart_station_to_destination)
 call walk_route(closest_bart_station_to_destination, destination)
 
 total route = walk_route_origin + bart_route + walk_route_destination 



puts public_transportation_route.compare(drive_route)