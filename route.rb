require 'nokogiri'
require 'open-uri'

class Route
  
  attr_reader :origin, :destination, :cost_in_pennies, :time_in_seconds

  def initialize(origin, destination, cost_in_pennies, time_in_seconds)
    @origin = origin
    @destination = destination
    @cost_in_pennies = cost_in_pennies
    @time_in_seconds = time_in_seconds
  end
  
  def self.bart(origin, destination)
    
    cost_in_pennies = calculate_bart_cost(origin,destination)
    #time_in_seconds = calculate_bart_time(origin,destination)
      
    Route.new(origin, destination, cost_in_pennies, 0)

  end
  
  private
  
  def self.calculate_bart_cost(origin, destination)
    
    origin_station_abbr = find_station_abbr(origin)
    destination_station_abbr = find_station_abbr(destination)
    
    costs_uri = "http://api.bart.gov/api/sched.aspx?cmd=fare&orig=#{origin_station_abbr}&dest=#{destination_station_abbr}&key=MW9S-E7SL-26DU-VV8V"
  
    costs_uri = Nokogiri::HTML(open(costs_uri))
    
    fare_in_dollars = costs_uri.css('fare').text.to_f
    cost_in_pennies = (fare_in_dollars * 100).to_i
    
  end  

  def self.find_station_abbr(address)
    
    address_to_abbr = {}
    station_addresses = []
    station_abbrs = []
    
    stations_uri = 'http://api.bart.gov/api/stn.aspx?cmd=stns&key=MW9S-E7SL-26DU-VV8V'
    
    xml_station_uri = Nokogiri::HTML(open(stations_uri))
    xml_station_uri.xpath('//address').each {|address| station_addresses << address.content }
    xml_station_uri.xpath('//abbr').each {|abbr| station_abbrs << abbr.content }
    
    station_addresses.length.times do |i|
      address_to_abbr[station_addresses[i]] = station_abbrs[i]
    end
        
    address_to_abbr[address]
    
  end
  
end