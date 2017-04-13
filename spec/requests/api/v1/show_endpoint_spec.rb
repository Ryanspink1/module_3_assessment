require 'rails_helper'

  describe 'Item API' do
    it "will show a single item" do
      Item.create(id: 1,name: "Alabaster", description: "Jabrony", image_url: "http://robohash.org/1.png?set=set2&bgset=bg1&size=200x200")

      get '/api/v1/items/1'

      item = JSON.parse(response.body)
      byebug
    end
  end
