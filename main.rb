require './route'
puts "Hello there you useless pile of organic matter. \n Welcome to the Bart or Drive calculator."

puts "Please enter your starting address:"
origin = gets.chomp

puts "Please enter your ending address."
destination = gets.chomp

puts "Computing Drive Route....."
drive_route = DriveRoute.new(origin,destination)
puts "Computing Bart Route....."
public_transportation_route = PublicRoute.new(origin,destination)

puts "Driving time: " + (drive_route.calc_drive_time * 60).to_s + " minutes"
puts "Driving cost: $" + (drive_route.calc_drive_cost * 100).to_s
puts "---"
puts "Bart time: " + (bart_route.time_in_seconds * 100).to_s
puts "Bart cost: " + (bart_route.cost_in_pennies * 60).to_s + " minutes"
puts "Decision:"
puts  (drive_route.compare(public_transportation_route).class == DriveRoute ? "DRIVE" : "BART")