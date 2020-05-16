class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :new, :update, :destroy, :create]
  before_action :find, only: [:edit, :show, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def edit
    @categories = Category.all
  end

  def show
    @comments = @article.comments
    @comment = Comment.new
  end

  def update
    @article_params = article_params
    @article_params[:tags] = params[:article][:tags].split
    Obscenity.sanitize @article_params[:content]
    @article.update(@article_params)
    @article.save_category
    redirect_to @article
  end

  def create
    @article_params = article_params
    Obscenity.sanitize @article_params[:content]
    @article_params[:tags] = params[:article][:tags].split
    @article = current_user.articles.create(@article_params)

    @article.save_category
    redirect_to @article
  end

  def destroy
    @article.categories.destroy_all
    @article.comments.destroy_all
    @article.destroy
    redirect_to root_path
  end

  private
    def find
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content, :category_ids)
    end
end
