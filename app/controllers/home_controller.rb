class HomeController < ApplicationController
  def index
    redirect_to users_profile_path(current_user.id) if user_signed_in?
  end

  def explore
    @articles = Article.all.order("created_at DESC").limit(3)
  end
end
