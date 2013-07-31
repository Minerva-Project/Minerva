class UsersController < ApplicationController
  before_filter :authenticate_user!, except: 'index'

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to users_url
    else
      render action: 'new'
    end
  end
end
