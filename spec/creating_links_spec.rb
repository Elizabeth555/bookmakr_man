require 'spec_helper'
require './bookmark_manager.rb'

feature "Adding a site's address and title to bookmark manager" do
  scenario "Saving a website" do
    visit ('/new')
    fill_in('title', with: 'Buzzfeed')
    fill_in('url', with: 'www.buzzfeed.com')
    click_button "Submit"
    within 'ul#links' do
      expect(page).to have_content('Buzzfeed')
    end
  end
end
