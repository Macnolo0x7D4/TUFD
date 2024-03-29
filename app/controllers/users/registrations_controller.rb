# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    if verify_recaptcha
      if User.find_by_username sign_up_params[:username]
        build_resource(sign_up_params)
        clean_up_passwords(resource)
        flash.now[:alert] = 'User already token.'
        flash.delete :user_already_token_error
        render :new
      else
        super
      end
    else
      build_resource(sign_up_params)
      clean_up_passwords(resource)
      flash.now[:alert] = 'There was an error with the ReCaptcha code below. Please re-enter the code.'
      flash.delete :recaptcha_error
      render :new
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  def destroy
    resource.articles.each do |article|
      article.categories.destroy_all
      article.comments.destroy_all
    end
    resource.articles.destroy_all
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username bio first_name last_name])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
