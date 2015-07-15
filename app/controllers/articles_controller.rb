class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :destroy, :edit, :update]

  def index
    @articles = params[:search] ? Article.content_search(params[:search]) : Article.all
  end

  def show

  end

  def edit

  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.author = current_member
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def update
    if @article.update_attributes(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :contents)
    end
end