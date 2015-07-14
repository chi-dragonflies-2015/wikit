require 'rails_helper'

describe ArticlesController do
let!(:author) { create(:member)}
let!(:article) { create(:article) }

  describe "GET #index" do
    it "assigns all articles as @articles" do
      get :index
      expect(assigns(:articles)).to eq(Article.all)
    end
  end

  describe "GET #show" do
    it "assigns the requested article as @article" do
      get :show, { id: article.to_param }
      expect(assigns(:article)).to eq(article)
    end

  end

  describe "GET #new" do
    it "assigns a new article" do
      get :new
      expect(assigns(:article).id).to eq nil
    end
  end

  describe "POST create" do

    context "when valid params are passed" do

      it "creates a new Article" do
        allow(request.env['warden']).to receive(:authenticate!) { article.author }
        allow(controller).to receive(:current_member) { article.author }
        expect { post :create, article: {title: article.title, contents: article.contents, author: article.author} }.to change{ Article.all.count }.by(1)
      end

      it "assigns a newly created article as @article" do
        allow(request.env['warden']).to receive(:authenticate!) { article.author }
        allow(controller).to receive(:current_member) { article.author }
        post :create, article: { title: article.title, contents: article.contents, author: article.author }
        expect(assigns(:article)).to eq(Article.last)
      end

      it "redirects to the created article" do
        allow(request.env['warden']).to receive(:authenticate!) { article.author }
        allow(controller).to receive(:current_member) { article.author }
        post :create, article: { title: article.title, contents: article.contents, author: article.author }
        expect(response).to redirect_to action: :show, id: assigns(:article).id
      end
    end

    context "when invalid params are passed" do
      it "assigns a newly created but unsaved article as @article" do
        post :create, article: { title: article.title, contents: article.contents, author: nil }
        expect(assigns(:article).id).to eq nil
      end

      it "re-renders the 'new' template" do
        post :create, article: { title: article.title, contents: article.contents, author: nil }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "DELETE #destroy" do
    it "assigns the requested article as @article" do
      delete :destroy, { id: article.to_param }
      expect(assigns(:article)).to eq(article)
    end

    it "destroys the requested article" do
      expect {
        delete :destroy, id: article.id
      }.to change(Article, :count).by(-1)
    end

    it "redirects to the article list" do
      delete :destroy, { id: article.to_param }
      expect(response).to redirect_to action: :index
    end
  end
end