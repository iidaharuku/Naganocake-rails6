# frozen_string_literal: true

class EndUsers::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:new,:create]
  before_action :end_user_withdraw_state, only: [:create]
  def after_sign_in_path_for(resource)
    root_path
  end
  def after_sign_out_path_for(resource)
    root_path
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :last_name, :first_name, :last_kana_name, :first_kana_name, :postal_code, :address, :telephone_number, :password, :password_confirmation, :commit])
  end

  def end_user_withdraw_state
    @end_user = EndUser.find_by(email: params[:end_user][:email])
    return if !@end_user
    # @withdraw_status = EndUser.find_by(email: params[:end_user][:withdraw_status])
    if @end_user.valid_password?(params[:end_user][:password]) && @end_user.withdraw_status != false
      redirect_to new_end_user_registration_path
    end
  end
end