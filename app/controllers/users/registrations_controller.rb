class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params
  before_action :configure_account_update_params
  prepend_before_action :authenticate_scope!, only: [:edit,:edit_info, :info, :update, :destroy, :show]

  # GET /resource/sign_up
  #def new
  # super
  #end

  # Get /users/info
  #def info
  #end

 # def show
  #end

  def edit_info
  end

  # POST /resource
  def create
    super
    if resource.save
      #resource.create_virtual_account
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
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation, :name, :personal_id, :address)
    end
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update) do |u| 
      u.permit(:password, :password_confirmation, :name, :personal_id, :license_pic_rear, :license_pic_front, :id_pic_rear, :id_pic_front , :birthday, :phone, :address, :school, :phone_mac, :enrollment, :e_contact_name, :e_contact_relat, :e_contact_phone)
    end
  end

  def update_resource(resource, params)
    if params[:password].blank?
      resource.update_without_password(params.except(:current_password))
    else
      super
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  def after_inactive_sign_up_path_for(resource)
    notices_signup_path
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
