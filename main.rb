require './route'
require "./drive_route"
require './public_route'
puts "Hello there you useless pile of organic matter. \n Welcome to the Bart or Drive calculator."

puts "Please enter your starting address:"
origin = gets.chomp

puts "Please enter your ending address."
destination = gets.chomp

puts "Computing Drive Route....."
drive_route = DriveRoute.new(origin,destination)

public_transportation_route = PublicRoute.new(origin,destination)
puts "Driving time: " + (drive_route.calc_drive_time / 60).to_s + " minutes"
puts "Driving cost: $" + (drive_route.calc_drive_cost / 100.0).round(2).to_s
puts "---"
puts "Computing Bart Route....."
puts "Bart time: " + (public_transportation_route.time_in_seconds / 60).to_s
puts "Bart cost: " + (public_transportation_route.cost_in_pennies / 100).to_s + " minutes"
puts "Decision:"
puts  (drive_route.compare(public_transportation_route).class == DriveRoute ? "DRIVE" : "BART")