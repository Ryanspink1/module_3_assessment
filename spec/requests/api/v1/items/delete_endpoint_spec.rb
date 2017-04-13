require 'rails_helper'

  describe 'Item API' do
    it "can delete an item" do
      VCR.use_cassette('cassettes/delete') do
        Item.create(id: 1,name: "Alabaster", description: "Jabrony", image_url: "http://robohash.org/1.png?set=set2&bgset=bg1&size=200x200")

        expect(Item.count).to eq(1)

        delete '/api/v1/items/1'

        expect(Item.count).to eq(0)
      end
    end
  end
