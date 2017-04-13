require 'rails_helper'

  describe 'best_buy_service' do
    it 'connects to the best_buy api' do

      stores = BestbuyService.new.find_stores(80202)
byebug
      # expect(stores)
    end
  end
