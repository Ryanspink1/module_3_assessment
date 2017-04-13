class Store
  attr_reader :name,
              :phone,
              :city,
              :distance,
              :store_type,
              :store_number
  def initialize(params, store_number)
    @name       = params[:name]
    @phone      = params[:city]
    @city       = params[:distance]
    @distance   = params[:phone]
    @store_type = params[:storeType]
    @store_number = store_number
  end

  def self.search_best_buy(zip)
    stores = BestbuyService.new.find_stores(zip)
    store_number = find_total_stores(stores)
    stores[:stores].map do |store|
      Store.new(store, store_number)
    end
  end

  def self.find_total_stores(stores)
    stores[:total]
  end

end
