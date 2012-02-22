require 'nokogiri'
require 'open-uri'
require './route'
require 'time'

class BartRoute < Route
  
  def initialize(origin, destination)
    
    @origin = origin
    @destination = destination
    
    @cost_in_pennies = calculate_bart_cost(@origin,@destination)
    @time_in_seconds = calculate_bart_time(@origin,@destination)
    
  end

  def calculate_bart_time(origin, destination)
    origin_station_abbr = find_station_abbr(origin)
    destination_station_abbr = find_station_abbr(destination)
    
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

    origin_station_abbr = find_station_abbr(origin)
    destination_station_abbr = find_station_abbr(destination)

    costs_uri = "http://api.bart.gov/api/sched.aspx?cmd=fare&orig=#{origin_station_abbr}&dest=#{destination_station_abbr}&key=MW9S-E7SL-26DU-VV8V"

    doc = Nokogiri::HTML(open(costs_uri))

    fare_in_dollars = doc.css('fare').text.to_f
    cost_in_pennies = (fare_in_dollars * 100).to_i

  end  

  def find_station_abbr(address)
    
    address_to_abbr = {}
    station_addresses = []
    station_abbrs = []

    stations_uri = 'http://api.bart.gov/api/stn.aspx?cmd=stns&key=MW9S-E7SL-26DU-VV8V'
    
    doc = Nokogiri::HTML(open(stations_uri))
    doc.xpath('//address').each {|address| station_addresses << address.content }
    doc.xpath('//abbr').each {|abbr| station_abbrs << abbr.content }    

    station_addresses.length.times do |i|
      address_to_abbr[station_addresses[i]] = station_abbrs[i]
    end
    address_to_abbr[address]

  end

end