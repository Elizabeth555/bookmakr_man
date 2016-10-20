require 'spec_helper'
require './bookmark_manager.rb'

feature "Add a user" do

  scenario "sign up" do
    visit ('/sign_up')
    fill_in('username', with: 'mermaids@ocean.com')
    fill_in('password', with: 'flounder')
    click_button "Submit"
    expect(page).to have_content("Welcome Ariel")
    expect(User.count).to change_by(1)
  end

end
