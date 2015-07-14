require 'rails_helper'

feature "User visits versions page of an article" do

  before :each do
    @article = create(:article)
    @article.update(contents: "red")
    @article.update(contents: "blue")
    @timestamp = @article.versions.sample.created_at
  end

  scenario "for a given article" do
    visit "/articles/#{@article.id}/versions"
    expect(page).to have_content(@timestamp)
  end
end