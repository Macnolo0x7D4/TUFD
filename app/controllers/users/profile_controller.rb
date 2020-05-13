class Users::ProfileController < ApplicationController
  before_action :find, only: [:show, :articles]

  def show
  end

  def articles
  end

  private
    def find
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(:avatar)
    end
end
