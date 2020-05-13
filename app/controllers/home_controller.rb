class HomeController < ApplicationController
  def index
  end

  def explore
    @articles = Article.all.order("created_at DESC").limit(3)
  end
end
