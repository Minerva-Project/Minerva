class UsersController < ApplicationController
  before_filter :authenticate_user!, except: 'index'

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to users_url
    else
      render action: 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_path
    else
      render 'new'
    end
  end
end