class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  def nctu
    require 'uri'
    require 'json'
    require 'net/http'
    require 'net/https'

    code = request.GET['code']

    uri = URI('https://id.nctu.edu.tw/o/token/')
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true

    token_request = Net::HTTP::post_form(uri,
      'grant_type'=> 'authorization_code',
      'code'=> code,
      'client_id'=> Rails.application.secrets.NCTU_OAUTH_KEY,
      'client_secret'=> Rails.application.secrets.NCTU_OAUTH_SECRET_KEY,
      'redirect_uri'=> 'http://dev.looplus.com.tw:7122/nctuoauth' )

    token = JSON.parse(token_request.body)

    uri = URI("https://id.nctu.edu.tw/api/profile/")
    data_request = Net::HTTP::Get.new(uri)
    data_request['Authorization'] = "Bearer #{token['access_token']}"
    res = Net::HTTP.start(uri.hostname, uri.port) {|http|
      https.request(data_request)
    }

    response = res.body
    @user = User.from_omniauth_nctu(response);
    if @user.persisted?
      if @user.has_role? :pending
        my_notice = "登入成功，請至個人頁面完成註冊"
      else
        my_notice = "登入成功，歡迎回來#{@user.name}"
      end

      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success => my_notice) if is_navigational_format?

    else
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
