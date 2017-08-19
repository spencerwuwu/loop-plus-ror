class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params
  before_action :configure_account_update_params
  prepend_before_action :authenticate_scope!, only: [:edit,:edit_info, :info, :update, :destroy, :show]

  # GET /resource/sign_up
  #def new
  # super
  #end

  # Get /users/info
  def info
  end

  def show
  end

  def edit_info
  end

  def oauth
    require 'uri'
    require 'json'
    require 'net/http'
    require 'net/https'

    Rails.logger.info "Request para: #{request.GET['code']}"
    
    code = request.GET['code']

    headers = {
      'grant_type'=> 'authorization_code',
      'code'=> code,
      'client_id'=> 'HkrBkhvzPhOBzrjq90gEPfsw4uMbMVT9nQlEqq7U',
      'client_secret'=> 'dTeq6QuMw7YlJgcPi7Fvd9XEcbyE8Nz1cMeX4C6ns74M2NTyNyvjaK7i8Fkc8tgvoICC1PCecPccxCyv1bC2vWy6JgA6oH2UY70qh1lPNFztqVflPJEZo75flZDy2oOM',
      'redirect_uri'=> 'http://dev.looplus.com.tw:7122/oauth'}

    uri = URI('https://id.nctu.edu.tw/o/token/')
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true

    token_request = Net::HTTP::post_form(uri,
      'grant_type'=> 'authorization_code',
      'code'=> code,
      'client_id'=> 'HkrBkhvzPhOBzrjq90gEPfsw4uMbMVT9nQlEqq7U',
      'client_secret'=> 'dTeq6QuMw7YlJgcPi7Fvd9XEcbyE8Nz1cMeX4C6ns74M2NTyNyvjaK7i8Fkc8tgvoICC1PCecPccxCyv1bC2vWy6JgA6oH2UY70qh1lPNFztqVflPJEZo75flZDy2oOM',
      'redirect_uri'=> 'http://dev.looplus.com.tw:7122/oauth' )

    Rails.logger.info "token_request.body #{token_request.body}"
    token = JSON.parse(token_request.body)
    Rails.logger.info "token #{token}"
    Rails.logger.info  "Bearer #{token['access_token']}"

    uri = URI("https://id.nctu.edu.tw/api/profile/")
    data_request = Net::HTTP::Get.new(uri)
    data_request['Authorization'] = "Bearer #{token['access_token']}"
    res = Net::HTTP.start(uri.hostname, uri.port) {|http|
      https.request(data_request)
    }

    Rails.logger.info res.body
    @response = res.body

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
      u.permit(:email, :password, :password_confirmation, :name, :personal_id, :photo, :photo_cache, :birthday, :phone, :address, :school, :phone_mac, :enrollment)
    end
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update) do |u| 
      u.permit(:password, :password_confirmation, :name, :personal_id, :photo, :birthday, :phone, :address, :school, :phone_mac, :enrollment)
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

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
