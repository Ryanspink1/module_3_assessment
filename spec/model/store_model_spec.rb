require 'rails_helper'
  describe 'store' do
    it 'returns store objects' do

      @stores = Store.search_best_buy(80202)

      first_store = @stores.first
      last_store  = @stores.last

      expect(first_store.name).to eq("CHERRY CREEK MALL")
      expect(first_store.phone).to eq("303-270-9189")
      expect(first_store.city).to eq("DENVER")
      expect(first_store.distance).to eq(3.45)
      expect(first_store.store_type).to eq("Mobile SAS")

      expect(last_store.name).to eq("BOULDER CO")
      expect(last_store.phone).to eq("303-938-2889")
      expect(last_store.city).to eq("BOULDER")
      expect(last_store.distance).to eq(22.79)
      expect(last_store.store_type).to eq("Big Box")

      expect(first_store.name).to_not eq("LAKEWOOD")
      expect(first_store.phone).to_not eq("303-270-9100")
      expect(first_store.city).to_not eq("Cleveland")
      expect(first_store.distance).to_not eq(10)
      expect(first_store.store_type).to_not eq("heloSAS")


    end
  end
