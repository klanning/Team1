require 'nokogiri'
require 'open-uri'
require './google_directions_wrapper'

class BartDirectory
  
  def initialize
    @address_to_abbr = {}
    @station_addresses = []
    @station_abbrs = []
    
    populate_directory
  end

  def populate_directory
    stations_uri = 'http://api.bart.gov/api/stn.aspx?cmd=stns&key=MW9S-E7SL-26DU-VV8V'
    
    doc = Nokogiri::HTML(open(stations_uri))
    doc.xpath('//address').each {|address| @station_addresses << address.content }
    doc.xpath('//abbr').each {|abbr| @station_abbrs << abbr.content }    

    @station_addresses.length.times do |i|
      @address_to_abbr[@station_addresses[i]] = @station_abbrs[i]
    end
    
  end
  
  def bart_address?(address)
    @station_addresses.include?(address) ? address : nil
  end
  
  def get_abbr(address)
    @address_to_abbr[address]
  end 
  
  def closest_station(address)
    walktime_to_stations = {}
    @station_addresses.each do |station_address|
      walking_time = GoogleDirectionsWrapper.new(address, station_address + " California", "walking").route_time
      walktime_to_stations[walking_time] = station_address
      sleep 0.25
    end
    walktime_to_stations[walktime_to_stations.keys.sort[0]]
  end

end