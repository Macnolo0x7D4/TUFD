class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_article
  before_action :find_like, only: [:destroy]

  def create
    @like = current_user.likes.new
    @like.article = @article

    unless @like.save
      puts "Failed to create comment"
    end

    redirect_to @article
  end

  def destroy
    @like.destroy
    redirect_to @article
  end

  private
  def find_article
    @article = Article.find(params[:article_id])
  end

  def find_like
    @like = Like.find(params[:id])
  end
end
