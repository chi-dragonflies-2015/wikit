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
    admin = admin.
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