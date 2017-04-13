class BestbuyService
  def initialize
    @connection = Faraday.new("https://api.bestbuy.com/v1/stores")
    @secret     = open('lib/assets/.secret_key').read.gsub("\n","")
  end


  def find_stores(zip)
    parse(Faraday.new("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeType,name,city,distance,phone&pageSize=16&apiKey=#{@secret}").get)
  end

private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end


# curl "https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeType,name,city,distance,phone&pageSize=2&apiKey=YourAPIKey"
