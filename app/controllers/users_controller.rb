class UsersController < ApplicationController
  before_filter :authenticate_user!, except: 'index'

  def index
    @course = Course.find_by_id(params[:course_id])
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
    user = User.new(params[:user])
    
    if user.save
      redirect_to users_url, notice: "Usuario criado"
    else
      render 'new'
    end
    
    create_log user
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
   if params[:search]
    @users = User.basic_search(params[:search]).paginate(:page => params[:page])
   else
    @users = User.paginate(:page => params[:page], :per_page => 3)
   end
  end
  
  def create_log user
    time = Time.now
    text = "#{current_user.first_name} #{current_user.last_name} criou o usuario #{user.first_name} #{user.last_name} at #{time}"
    Log.create(:text=>text)
  end
end
