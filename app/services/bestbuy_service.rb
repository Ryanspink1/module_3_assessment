class BestbuyService
  def initialize
    @connection = Faraday.new("https://api.bestbuy.com/v1/stores")
    @secret     = open('lib/assets/.secret_key').read.gsub("\n","")
  end


  def find_stores(zip)
    parse(@connection.get("(area(#{zip},25))?format=json&show=storeType,name,city,distance,phone&pageSize=10&apiKey=#{@secret}"))
  end

private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end


curl "https://api.bestbuy.com/v1/stores(area(55423,10))?format=json&show=storeId,storeType,name&pageSize=2&apiKey=YourAPIKey"
