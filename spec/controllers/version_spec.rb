require 'rails_helper'

describe VersionsController do
  let!(:article) { Article.create!(title: 'Sample', contents: 'This is a sample article', author_id: 1)}
  let!(:versions) { article.versions }

  describe "GET #index" do
    it "assigns @article" do
      get :index, { article_id: article.to_param }
      expect(assigns(:article)).to eq(article)
    end
    it "assigns versions off of article" do
      get :index, { article_id: article.to_param }
      expect(assigns(:versions)).to eq(versions)
    end
  end

end