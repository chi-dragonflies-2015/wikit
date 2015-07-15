class TagsController < ApplicationController

  def new
    @tag = Tag.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @article = Article.find_by(id: params[:article_id])
    @tag = @article.tags.create(params[:tag])

    if @tag.save
      respond_to do |format|
        format.html { redirect_to @article }
        format.js
      end
    else
      render 'new'
    end
  end


  def index
    @article = Article.find_by(id: params[:article_id])
    @tags = @article.tags
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end