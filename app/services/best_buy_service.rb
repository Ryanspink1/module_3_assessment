class BestBuyService
  def initialize
    @connection = Faraday.new("https://api.bestbuy.com/v1/stores")
    @secret     = open('lib/assets/.secret_key').read.gsub("\n","")
  end


  def find_stores(zip, distance)
    parse(@connection.get("(area(#{zip},#{distance}))?format=json&show=storeType,name,city,distance,phone&pageSize=10&apiKey=#{@secret}"))
  end

private

  def parse(response)
    Json.parse(response.body, symbolize_names: true)
  end
end
