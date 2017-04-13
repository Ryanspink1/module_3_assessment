require 'rails_helper'

  describe 'Item API' do
    it "can create a new item" do


      post '/api/v1/items?name=jabron&description=abalone&image_url=https://robohash.org/0.png?set=set2%26bgset=bg1%26size=200x200'

      item = Item.first

      expect(item.name).to eq("jabron")
      expect(item.description).to eq("abalone")
      expect(item.image_url).to eq('https://robohash.org/0.png?set=set2&bgset=bg1&size=200x200')

      expect(item.name).to_not eq("abalone")
      expect(item.description).to_not eq("jabron")
      expect(item.image_url).to_not eq('https://robohash.org')
    end
  end
