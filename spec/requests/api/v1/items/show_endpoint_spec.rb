require 'rails_helper'

  describe 'Item API' do
    it "will show a single item" do
      Item.create(id: 1,name: "Alabaster", description: "Jabrony", image_url: "http://robohash.org/1.png?set=set2&bgset=bg1&size=200x200")

      get '/api/v1/items/1'

      item = JSON.parse(response.body)

      expect(item).to have_key("id")
      expect(item).to have_key("name")
      expect(item).to have_key("description")
      expect(item).to have_key("image_url")

      expect(item["id"]).to eq(1)
      expect(item["name"]).to eq("Alabaster")
      expect(item["description"]).to eq("Jabrony")
      expect(item["image_url"]).to eq("http://robohash.org/1.png?set=set2&bgset=bg1&size=200x200")

      expect(item["id"]).to_not eq(2)
      expect(item["name"]).to_not eq("Jabron")
      expect(item["description"]).to_not eq("Alab")
      expect(item["image_url"]).to_not eq("http://robohash.org/1.png?set=1&size=200x200")
    end
  end
