require 'nokogiri'
require 'open-uri'
require './route'
require './bart_directory'
require 'time'

class BartRoute < Route
  
  def initialize(origin, destination)
    
    @directory = BartDirectory.new
    
    @origin = origin
    @destination = destination
    
    @cost_in_pennies = calculate_bart_cost(@origin,@destination)
    @time_in_seconds = calculate_bart_time(@origin,@destination)
    
  end

  def calculate_bart_time(origin, destination)
    origin_station_abbr = @directory.get_abbr(origin)
    destination_station_abbr = @directory.get_abbr(destination)
    
    time_uri = "http://api.bart.gov/api/sched.aspx?cmd=depart&orig=#{origin_station_abbr}&dest=#{destination_station_abbr}&key=MW9S-E7SL-26DU-VV8V"

    doc = Nokogiri::HTML(open(time_uri))

    current_time = Time.parse(doc.css('time').text)    
    destination_time = nil
    
    doc.css('trip').each do |trip|
      if Time.parse(trip["origtimemin"]) > current_time
        destination_time = Time.parse(trip["desttimemin"])
        break
      end
    end
    destination_time - current_time
    
  end

  def calculate_bart_cost(origin, destination)

    origin_station_abbr = @directory.get_abbr(origin)
    destination_station_abbr = @directory.get_abbr(destination)

    costs_uri = "http://api.bart.gov/api/sched.aspx?cmd=fare&orig=#{origin_station_abbr}&dest=#{destination_station_abbr}&key=MW9S-E7SL-26DU-VV8V"

    doc = Nokogiri::HTML(open(costs_uri))

    fare_in_dollars = doc.css('fare').text.to_f
    cost_in_pennies = (fare_in_dollars * 100).to_i

  end  

end