require 'spec_helper'
require './bookmark_manager.rb'

feature "Add a user" do
  scenario "sign up" do
    visit ('/sign-up')
    fill_in('username', with: 'mermaids@ocean.com')
    fill_in('password', with: 'flounder')
    expect{click_button('Submit')}.to change{User.user_count}.by(1)
    # click_button('Submit')
    expect(page).to have_content("Welcome mermaids@ocean.com")
  end
end
