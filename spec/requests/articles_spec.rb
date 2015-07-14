require 'rails_helper'

RSpec.describe "Articles", :type => :request do
  describe "GET /articles" do
    it "is successful" do
      get articles_path
      expect(response.status).to be(200)
    end
  end

  describe "GET /new" do
    it "is successful" do
      get new_article_path
      expect(response.status).to be(200)
    end
  end
end