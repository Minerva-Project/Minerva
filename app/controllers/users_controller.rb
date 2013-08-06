class UsersController < ApplicationController
  before_filter :authenticate_user!, except: 'index'
  
 
  def index
    @users = User.all
  end

  def show
    
    @user = User.find(params[:id])
    if Profile.find_by_id(params[:id])
      @profile = Profile.find(params[:id])
    else
      @profile == nil
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
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

  def search

    @users = User.search(params[:search]) 
   # @users = User.paginate(:page => params[:page], :per_page => 3) 

  end

end




