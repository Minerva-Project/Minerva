class CoursesController < ApplicationController
before_filter :map

  def index
    @courses = Course.all
    @user = current_user
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def edit
    @course = Course.find(params[:id])
  end

  def create
    course = Course.new(params[:course])
    
    if course.save
      redirect_to course, notice: 'O curso foi criado corretamente.'
    else
      render "new"
    end
    
    create_log(course, "create")
  end

  def update
    @course = Course.find(params[:id])

    if @course.update_attributes(params[:course])
      redirect_to @course, notice: 'O curso foi atualizado corretamente.'
    else
      render action: "edit"
    end
  end

  def destroy
    course = Course.find(params[:id])
    course.destroy
    redirect_to courses_url
    
    create_log(course, "destroy")
  end

  def map
    @name = User.all.map{ |u| if u.role == 'teacher' and u.first_name != nil; u.first_name + " #{u.last_name}" ; end; }.compact
  end

  def add
    user = User.find(params[:user_id])
    course = Course.find(params[:id])
    
    course.users << user
    course.save!
    
    create_log(course, "add", user)
    redirect_to course, notice: "Criado"
  end

  def remove
    user = User.find(params[:user_id])
    course = Course.find(params[:id])
    
    if  course.users.destroy(user)
      create_log(course, "remove", user)
      redirect_to course, notice: "Removido"
    end
  end
  
  def create_log(course, action, user=nil)
    date_time = DateTime.now
    action = action
    user_action = "#{current_user.first_name} #{current_user.last_name}"
    
    if user.nil? 
      target = course.title
      body = {:user_action=>user_action, :action=>action, :target=>target, :date_time=>date_time}
    else
      target = "#{user.first_name} do curso de #{course.title}"
      body = {:user_action=>user_action, :action=>action, :target=>target, :date_time=>date_time}
    end
    
    Log.create(body)
  end
end
