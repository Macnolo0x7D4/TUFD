class UsersController < ApplicationController
  before_action :find, only: [:articles]

  def articles
    @articles = @user.articles
  end

  def find
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:avatar)
  end
end
