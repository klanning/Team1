require 'net/http'

class GasPrice

  def self.find_gas_price(zipcode)
    url = "http://api.mshd.net/?gasprice=#{zipcode}"
    uri = URI(url)
    http = Net::HTTP.get(uri)
    result = http.match("\"regular\":").post_match.match(",").pre_match
    result.to_f
  end
end