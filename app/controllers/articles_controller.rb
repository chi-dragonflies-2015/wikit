class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :destroy]

  def index
    @articles = Article.all
  end

  def show

  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    puts "************"
    puts article_params
    puts "************"
    @article.author = current_member
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
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