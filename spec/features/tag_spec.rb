require 'spec_helper'
require './bookmark_manager.rb'

feature "Add a tag to a link" do
  scenario "adding a tag" do
    visit ('/new')
    fill_in('title', with: 'Girls')
    fill_in('url', with: 'www.pink.com')
    fill_in('tag', with: 'pink')

    click_button "Submit"
    link = Link.first
    expect(link.tags.map(&:name)).to include('pink')
  end
end
