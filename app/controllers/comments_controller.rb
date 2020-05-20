# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :set_comment, only: [:destroy]
  before_action :set_article

  def create
    @comment_params = comment_params
    Obscenity.sanitize @comment_params[:content]
    @comment = current_user.comments.new(@comment_params)
    @comment.article = @article

    if @comment.save
      redirect_to @comment.article
    else
      puts 'Failed to create comment'
    end
  end

  def destroy
    @comment.destroy
    redirect_to @article
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :likes)
  end
end
