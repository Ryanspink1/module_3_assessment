require 'rails_helper'

  describe 'when a user searches for stores by zip code' do
    it 'they are given a list of stores within 25 miles of that zip code' do

      visit '/items'


      fill_in "search", with: "80202"
      click_button 'Search'


      expect(current_path).to eq('/search')

      expect(page).to have_content("CHERRY CREEK MALL")
      expect(page).to have_content("DENVER")
      expect(page).to have_content("3.45")
      expect(page).to have_content("Mobile SAS")

      expect(page).to_not have_content("Cleveland Mall")
      expect(page).to_not have_content("Cleveland")
      expect(page).to_not have_content("200000")
      expect(page).to_not have_content("Jabron")
    end
  end
