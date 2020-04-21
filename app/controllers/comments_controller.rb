class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_comment, only: [:update, :destroy]
  before_action :set_article

  def index
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.article = @article

    if @comment.save
      redirect_to @comment.article
    else
      puts "Failed to create comment"
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
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