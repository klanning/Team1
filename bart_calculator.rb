require './route'
require 'rubygems'
require 'open-uri'
require 'nokogiri'


class BartCalculator
  @list_of_stations = {}
  
  def initialize
    stations_uri = 'http://api.bart.gov/api/stn.aspx?cmd=stns&key=MW9S-E7SL-26DU-VV8V'
    xml_station_uri = Nokogiri::HTML(open(stations_uri))
    @station_addresses = []
    xml_station_uri.xpath('//address').each {|address| @station_addresses << address.content}
    @station_names = []
    xml_station_uri.xpath('//abbr').each {|name| @station_names << name.content}
    combined_array = @station_addresses.zip(@station_names)
    @station_list = Hash[*combined_array.flatten]
  end
  
  def calculate(start_address,end_address)
    if start_address.raw_string == end_address.raw_string
      return Route.new(start_address, end_address, 0, 0)
    end
    
    
    
    Route.new(start_address, end_address, calculate_cost(@station_list[start_address.raw_string],@station_list[end_address.raw_string]))  
  end
  
  def calculate_cost(origin_station, destination_station)
    output_fare = 0
    station_costs_uri = "http://api.bart.gov/api/sched.aspx?cmd=fare&orig=#{origin_station}&dest=#{destination_station}&key=MW9S-E7SL-26DU-VV8V"
    xml_costs_uri = Nokogiri::HTML(open(station_costs_uri))
    xml_costs_uri.xpath('//fare').each {|fare| output_fare = fare.content.to_f * 100}
    return output_fare.to_i
  end
  
end


