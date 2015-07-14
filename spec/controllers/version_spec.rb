require 'rails_helper'

describe VersionsController do
  let!(:article) { create(:article) }
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

  describe "GET #show" do
    it "assigns @version" do

      original_contents = article.contents
      article.update(contents: "testing 2-3-4")
      version = article.versions.last

      get :show, { id: version.id, article_id: article.to_param }
      expect(assigns(:version).reify.contents).to eq(original_contents)
    end
    # it "assigns versions off of article" do
    #   get :index, { article_id: article.to_param }
    #   expect(assigns(:versions)).to eq(versions)
    # end
  end

end