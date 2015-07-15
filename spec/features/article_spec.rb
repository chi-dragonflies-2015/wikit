require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature "User visits the website" do
  scenario "when user visits the root" do
    visit '/'
    expect(page).to have_content("Hello World! Welcome to Wikit!")
  end
end

feature "Homepage shows links to featured articles" do
  scenario "when there exist featured articles" do
    featured_article = Article.create(title: "Sample title", contents: "Sample contents", author: Member.create(email: "test@test.com", password: "password"), featured: true)
    visit '/'
    find_link(featured_article.title).visible?
  end
end

feature "Admins can feature or un-feature articles" do
  before(:each) do
    admin = FactoryGirl.create(:member)
    admin.update_attributes(admin: true)
    login_as(admin , :scope => :member)
  end

  scenario "when an admin looks at an un-featured article's show page" do
    unfeatured_article = Article.create(title: "Sample title", contents: "Sample contents", author: Member.create(email: "test@test.com", password: "password"))
    visit "/articles/#{unfeatured_article.id}/edit"
    page.uncheck('article_featured')
  end
  scenario "when an admin looks at a featured article's show page" do
    featured_article = Article.create(title: "Sample title", contents: "Sample contents", author: Member.create(email: "test@test.com", password: "password"), featured: true)
    visit "/articles/#{featured_article.id}/edit"
    page.check('article_featured')
  end
end

feature "Article state" do
  before(:each) do
    admin = FactoryGirl.create(:member)
    admin.update_attributes(admin: true)
    login_as(admin , :scope => :member)
  end

  scenario "is displayed for a given article" do
    article = FactoryGirl.create(:article)
    visit "/articles/#{article.id}"
    expect(page).to have_content(article.state)
  end
  scenario "can be edited by an admin" do
    article = FactoryGirl.create(:article)
    visit "articles/#{article.id}/edit"
    page.choose('article_state_unpublished')
    page.choose('article_state_published')
    page.choose('article_state_needs_sources')
  end
end

feature "search capability!" do
  scenario "when user searches for something" do
    member = FactoryGirl.create(:member)
    login_as(member, :scope => :member)
    Article.create(title: "Example Title Green", contents: "a fish called wanda", author: member )
    Article.create(title: "Example Title Purple", contents: "a fish called harold", author: member)
    visit '/articles'
    fill_in('search', :with => 'wanda')
    click_button('Search')
    expect(page).to have_content("Green")
    expect(page).to_not have_content("Purple")
  end
end

feature "User searches for Articles of a certain tag" do
  scenario "user clicks tag link" do
    member = FactoryGirl.create(:member)
    login_as(member, :scope => :member)
    art = Article.create(title: "Example Title Green", contents: "a fish called wanda", author: member )
    art2 = Article.create(title: "Example Title Blue", contents: "a fish called wanda", author: member )
    art.tags.create(name:"history")
    visit "/articles/#{art.id}"
    click_link('history')
    expect(page).to have_content("Green")
    expect(page).to_not have_content("Blue")
  end
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
