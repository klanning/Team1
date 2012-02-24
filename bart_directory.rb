require 'nokogiri'
require 'open-uri'
require './google_directions_wrapper'

class BartDirectory
  
  def initialize
    @address_to_abbr = {}
    @station_addresses = []
    @station_abbrs = []
    
    @address_to_lat_long = {}
    @station_lat_longs = []
    @origin_address_lat_long = {}
    
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
    
    
    @station_lat_longs = doc.xpath('//station').map do |station|
         {"lat" => station.css('gtfs_latitude')[0].content.to_f, "lng" => station.css('gtfs_longitude')[0].content.to_f}  
    end
      
    @station_addresses.length.times do |i|
      @address_to_lat_long[@station_addresses[i]] = @station_lat_longs[i]
    end
     puts @address_to_lat_long
  end
  
  def bart_address?(address)
    @station_addresses.include?(address) ? address : nil
  end
  
  def get_abbr(address)
    @address_to_abbr[address]
  end 
  
  
  def get_lat_long(address)
    GoogleDirectionsWrapper.new(address, address , "driving").origin_lat_longs
    
  end
  
 
    
  def closest_station(address)
    address_lat_long = get_lat_long(address)
    current_min_distance = nil
    current_nearest_station = nil
    @address_to_lat_long.each do |station_address, station_lat_long|
      station_distance = compare_lat_longs(address_lat_long, station_lat_long)
      if (current_min_distance == nil or station_distance < current_min_distance)
        current_min_distance = station_distance
        current_nearest_station = station_address
      end
    end
    current_nearest_station  
  end
  
  def compare_lat_longs(origin_lat_long, station_address_lat_long)
    lat_difference = (origin_lat_long["lat"] - station_address_lat_long["lat"]).abs
    long_difference = (origin_lat_long["lng"] - station_address_lat_long["lng"]).abs
    sum_of_differences = lat_difference + long_difference
    sum_of_differences
  end
  
  
  
  
  # def closest_station(address)
  #   walktime_to_stations = {}
  #   @station_addresses.each do |station_address|
  #     walking_time = GoogleDirectionsWrapper.new(address, station_address + " California", "walking").route_time
  #     walktime_to_stations[walking_time] = station_address
  #     sleep 0.25
  #   end
  #   walktime_to_stations[walktime_to_stations.keys.sort[0]]
  # end
  #test push

end