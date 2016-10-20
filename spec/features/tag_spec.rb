require 'spec_helper'
require './bookmark_manager.rb'

feature "Add a tag to a link" do
  before :each do
    Link.create(url: "www.bbc.co.uk", title: "BBC", tags: [Tag.first_or_create(name:'news')])
    Link.create(url: "www.bubbles.com", title: "water", tags: [Tag.first_or_create(name: 'bubbles'), Tag.first_or_create(name:'dogs')])
    Link.create(url:"www.netflix.com", title: "Movies", tags: [Tag.first_or_create(name:'Movies')])
    Link.create(url:"www.dogs.com", title: "dogs!", tags: [Tag.first_or_create(name:'dogs')])
  end

  scenario "adding a tag" do
    visit ('/new')
    fill_in('title', with: 'Girls')
    fill_in('url', with: 'www.pink.com')
    fill_in('tag', with: 'pink')
    click_button "Submit"
    link = Link.all
    expect(link.tags.map(&:name)).to include('pink')
  end

  scenario "filter tags" do
    visit ('/tags/bubbles')
    expect(page).to have_content('water')
    expect(page).not_to have_content('BBC')
  end

  scenario "mutliple tags" do
    visit ('/tags/dogs')
    expect(page).to have_content('water')
    visit('/tags/bubbles')
    expect(page).to have_content('water')
  end

  scenario "spliting tags" do
    visit ('/new')
    fill_in('title', with: 'Magical')
    fill_in('url', with: 'www.mermaids.com')
    fill_in('tag', with: 'ocean,waves,hair')
    click_button "Submit"
    visit('/tags/ocean')
    expect(page).to have_content('Magical')
  end
end
