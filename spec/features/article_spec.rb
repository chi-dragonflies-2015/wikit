require 'rails_helper'

feature "User visits the website" do
  scenario "when user visits the root" do
    visit '/'
    expect(page).to have_content("Hello World! Welcome to Wikit!")
  end
  pending "when user visits the article index" do
    Article.create()
    visit '/index'
    expect(page).to have_content("")
  end
  scenario "when user searches for something" do
    Article.create(title: "Example Title Green", contents: "a fish called wanda", author: build(:author) )
    Article.create(title: "Example Title Purple", contents: "a fish called harold", author: build(:author))
    visit '/articles'
    fill_in('search', :with => 'wanda')
    click_button('Search')
    expect(page).to have_content("Green")
    expect(page).to_not have_content("Purple")
  end

  # Maybe write one to show that they are in the proper order?
end