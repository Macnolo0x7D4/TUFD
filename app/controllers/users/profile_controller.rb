# frozen_string_literal: true

class Users::ProfileController < ApplicationController
  before_action :find, only: %i[show articles]

  def show; end

  def articles; end

  private

  def find
    @user = User.friendly.find(params[:id])
  end

  def user_params
    params.permit(:avatar)
  end
end
