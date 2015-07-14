class VersionsController < ApplicationController

  def index
    @article = Article.find_by(id: params[:article_id])
    @versions = @article.versions

    render 'versions/index'
  end

  def show
    @article = Article.find_by(id: params[:article_id])
    @version = @article.versions.find_by(id: params[:id])
    @article = @version.reify
    render 'versions/show'
  end

end