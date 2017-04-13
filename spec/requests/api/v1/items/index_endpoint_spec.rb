require 'rails_helper'

  describe 'Items API' do
    it "index will show a multiple item" do
      Item.create(id: 1,name: "Alabaster", description: "Jabrony", image_url: "http://robohash.org/1.png?set=set2&bgset=bg1&size=200x200")
      Item.create(id: 2,name: "Hambone", description: "Brotrohedron", image_url: "http://www.google.com")

      get '/api/v1/items/'

      items = JSON.parse(response.body)
      first_item = items.first
      second_item = items.second


      expect(items.count).to eq(2)
      expect(items.count).to_not eq(3)

      expect(first_item).to have_key("id")
      expect(first_item).to have_key("name")
      expect(first_item).to have_key("description")
      expect(first_item).to have_key("image_url")

      expect(first_item["id"]).to eq(1)
      expect(first_item["name"]).to eq("Alabaster")
      expect(first_item["description"]).to eq("Jabrony")
      expect(first_item["image_url"]).to eq("http://robohash.org/1.png?set=set2&bgset=bg1&size=200x200")

      expect(second_item["id"]).to eq(2)
      expect(second_item["name"]).to eq("Hambone")
      expect(second_item["description"]).to eq("Brotrohedron")
      expect(second_item["image_url"]).to eq("http://www.google.com")

      expect(first_item["id"]).to_not eq(2)
      expect(first_item["name"]).to_not eq("Jabron")
      expect(first_item["description"]).to_not eq("Alab")
      expect(first_item["image_url"]).to_not eq("http://robohash.org/1.png?set=1&size=200x200")
    end
  end
