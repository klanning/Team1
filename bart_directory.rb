require 'nokogiri'
require 'open-uri'

class BartDirectory
  
  def initialize
    @address_to_abbr = {}
    @station_addresses = []
    @station_abbrs = []
    
    populate_directory
  end
  
  def bart_address?(address)
    @station_addresses.include?(address)
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
  
  def get_abbr(address)
    @address_to_abbr[address]
  end  
     
  
end