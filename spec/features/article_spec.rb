require 'rails_helper'

feature "User visits the website" do
  scenario "when user visits the root" do
    visit '/'
    expect(page).to have_content("Hello World! Welcome to Wikit!")
  end
  scenario "when user visits the article index" do
    Article.create()
    visit '/index'
    expect(page).to have_content("")
  end
end