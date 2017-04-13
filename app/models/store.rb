class Store
  attr_reader :name,
              :phone,
              :city,
              :distance,
              :store_type,
              :store_number
  def initialize(params)
    @name       = params[:name]
    @phone      = params[:city]
    @city       = params[:distance]
    @distance   = params[:phone]
    @store_type = params[:storeType]
    @store_number = Array.new
  end

  def self.search_best_buy(zip)
    stores = BestbuyService.new.find_stores(zip)
    find_total_stores(stores)
    stores[:stores].map do |store|
      Store.new(store)
    end
  end

  def self.find_total_stores(stores)
    byebug
    @store_number << stores[:total]
  end

end
