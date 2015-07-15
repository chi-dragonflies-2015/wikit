require 'rails_helper'

feature "User visits the website" do
  scenario "when user visits the root" do
    visit '/'
    expect(page).to have_content("Hello World! Welcome to Wikit!")
  end
end

feature "search capability!" do
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

feature "delete buttons!" do
  scenario "when user visits the article index as a member" do
    article = Article.create(title: "Example Title Green", contents: "a fish called wanda", author: build(:author) )
    member = FactoryGirl.create(:member)
    login_as(member, :scope => :member)
    visit '/articles'
    expect(page).to have_content(article.title)
    expect(page.has_link?("delete")).to be false
  end

  scenario "when user visits the article index as an admin" do
    article = Article.create(title: "Example Title Green", contents: "a fish called wanda", author: build(:author) )
    member = FactoryGirl.create(:member)
    member.admin = true
    member.save
    login_as(member, :scope => :member)
    visit '/articles'
    expect(page).to have_content(article.title)
    expect(page.has_link?("delete")).to be true
  end
end