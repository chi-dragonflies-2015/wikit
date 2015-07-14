require 'rails_helper'

feature "User visits versions page of an article" do

  before :each do
    @article = create(:article)
    @article.update(contents: "red")
    @article.update(contents: "blue")
    @timestamp = @article.versions[1..-1].sample.created_at
  end

  scenario "for a given article" do
    visit "/articles/#{@article.id}/versions"
    expect(page).to have_content(@timestamp)
  end
end

feature "User visits a specific version of an article" do

  before :each do
    @article = create(:article)
    @article.update(contents: "green")
    @version = @article.versions.last
  end

  scenario "for a given version" do
    visit "/articles/#{@article.id}/versions/#{@version.id}"
    expect(page).to have_content(@version.reify.contents)
  end

end