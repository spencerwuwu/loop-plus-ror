class Tail::UsersController < ApplicationController
  layout 'tail'

  def index
    @Users = User.all()

    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.all.order('created_at DESC')
    end
  end

  def show
    @user =  User.find(params[:id])
  end

  def auth_user(user)
    user.remove_role "pending"
    user.add_role "member"

    UserMailer.user_success(user).deliver.now!
    render_to tail_users_path
  end

  def user_reject(user, reason)
    UserMailer.user_reject(user, reason).deliver.now!
    render_to tail_users_path
  end

end
