class VersionsController < ApplicationController

  def index
    @article = Article.find_by(id: [params[:article_id]])
    @versions = @article.versions

    render 'versions/index'
  end

  def show
  end

end