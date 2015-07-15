require 'rails_helper'

describe TagsController do
  let!(:article) { create(:article) }

  describe "GET #new" do
    it "assigns @article" do
      get :new, { article_id: article.to_param }
      expect(assigns(:article)).to eq(article)
    end
    it "assigns @tag" do
      get :new, { article_id: article.to_param }
      expect(assigns(:tag)).to be_a(Tag)
    end
  end

  describe "POST #create" do
    it "assigns @article" do
      post :new, { article_id: article.to_param }
      expect(assigns(:article)).to eq(article)
    end
    it "creates and assigns Tag" do
      post :create, article_id: article.to_param, tag: { name: "history" }
      expect(assigns(:tag)).to eq(Tag.last)
    end
  end

end