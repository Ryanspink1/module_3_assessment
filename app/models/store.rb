class Store

  # def initialize
  #   @name       =
  #   @phone      =
  #   @city       =
  #   @distance   =
  #   @store_type =
  # end

  def search_best_buy
    stores =BestBuyService.new.find_stores(zip, distance)
    byebug
  end
end
