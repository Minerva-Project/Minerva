class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def create
    user = User.new(params[:user])
    user.save

    create_log(current_user.email, "create_user", user.email)
    redirect_to users_path
  end
  
  def update
    user = User.find(params[:id])
    
    user.update_attributes(params[:user])

    redirect_to users_path
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    
    create_log(current_user.email, "destroy_user", user.email)
    redirect_to users_path
  end
  
  def students_association
    @students = User.all_students
  end

end
