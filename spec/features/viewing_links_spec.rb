require 'spec_helper'
require './bookmark_manager.rb'

feature 'Seeing links on the hompage' do

  scenario 'So I can see existing links on the homepage'do
      Link.create(url: 'https://www.dogstrust.org.uk/', title: 'Dogs Trust')
      visit ('/')
      expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content("Dogs Trust")
  end
end
end
