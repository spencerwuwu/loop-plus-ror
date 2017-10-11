class Tail::UsersController < ApplicationController
  layout 'tail'

  def index

  end

  def status_pending
    @users = User.with_role(:pending)
    if params[:search]
      @users = User.with_role(:pending).search(params[:search]).order("created_at DESC")
    else
      @users = User.with_role(:pending).order('created_at DESC')
    end
  end

  def status_member
    @users = User.with_role(:member)
    if params[:search]
      @users = User.with_role(:member).search(params[:search]).order("created_at DESC")
    else
      @users = User.with_role(:member).order('created_at DESC')
    end
  end

  def status_un_finish
    @users = User.with_role(:member)
    if params[:search]
      @users = User.with_role(:member).search(params[:search]).order("created_at DESC")
    else
      @users = User.with_role(:member).order('created_at DESC')
    end
  end

  def status_all
    @users = User.all()
    if params[:search]
      @users = User.all().search(params[:search]).order("created_at DESC")
    else
      @users = User.all().order('created_at DESC')
    end
  end

  def show
    @user =  User.find(params[:id])
  end


  def user_auth
    @user = User.find(params[:id])

    @user.remove_role(:pending)
    @user.add_role(:member)

    UserMailer.user_success(@user).deliver
    redirect_to tail_users_path
  end

  def user_reject
    @user = User.find(params[:id])

    @user.remove_role(:pending)
    @user.add_role(:un_finish)

    @reason = params[:reason]
    UserMailer.user_reject(@user, @reason).deliver
    redirect_to tail_users_path
  end


end
