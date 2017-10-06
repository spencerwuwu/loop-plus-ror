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
end
