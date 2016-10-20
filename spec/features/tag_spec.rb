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

  scenario "filter tags" do
    Link.create(url: "www.bbc.co.uk", title: "BBC", tags: [Tag.first_or_create(name:'news')])
    Link.create(url: "www.bubbles.com", title: "water", tags: [Tag.first_or_create(name: 'bubbles')])

    visit ('/tags/bubbles')
    expect(page).to have_content('water')
    expect(page).not_to have_content('BBC')
  end
end
