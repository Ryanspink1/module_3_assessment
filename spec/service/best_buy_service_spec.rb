require 'rails_helper'

  describe 'best_buy_service' do
    it 'connects to the best_buy api' do

      stores = BestbuyService.new.find_stores(80202)

      expect(stores).to have_key(:from)
      expect(stores).to have_key(:to)
      expect(stores).to have_key(:currentPage)
      expect(stores).to have_key(:total)
      expect(stores).to have_key(:totalPages)
      expect(stores).to have_key(:queryTime)
      expect(stores).to have_key(:partial)
      expect(stores).to have_key(:canonicalUrl)
      expect(stores).to have_key(:stores)
      expect(stores).to have_key(:warnings)

      expect(stores).to_not have_key(:bestbuy)

      expect(stores[:stores].count).to eq(16)
      expect(stores[:stores].count).to_not eq(9)

      expect(stores[:total]).to eq(16)
      expect(stores[:total]).to_not eq(17)
    end
  end
