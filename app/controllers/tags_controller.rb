class TagsController < ApplicationController

  before_action :set_article, only: [:new, :create, :index, :destroy]
  before_action :authenticate_member!, only: [:create, :destroy]


  def new
    @tag = Tag.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @tag = @article.tags.create(tag_params)

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
    @tags = @article.tags
  end

  def destroy
    @tag = Tag.find_by(id: params[:id])
    @tag.destroy
    @tags = @article.tags
  end

  private

  def set_article
    @article = Article.find_by(id: params[:article_id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

end