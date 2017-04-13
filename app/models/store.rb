class Store

  # def initialize
  #   @name       =
  #   @phone      =
  #   @city       =
  #   @distance   =
  #   @store_type =
  # end

  def self.search_best_buy(zip)
    BestbuyService.new.find_stores(zip)
  end
end
