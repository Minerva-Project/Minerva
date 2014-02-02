class CoursesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @courses = Course.all
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
    course = Course.create(params[:course])
    
    create_log(current_user.email, "create_course", course.title)
    redirect_to courses_path
  end
  
  def destroy
    course = Course.find(params[:id])
    course.destroy
    
    create_log(current_user.email, "destroy_course", course.title)
    redirect_to courses_path
  end
  
  def update
    course = Course.find(params[:id])
    course.update_attributes(params[:course])
    redirect_to courses_path
  end
  
  def include_student
    course = Course.find(params[:id])
    
    course.users << User.find(params[:user_id])
    course.save!
    
    redirect_to courses_path
  end
  
  def remove_student
    course = Course.find(params[:id])
    student = User.find(params[:user_id])
    
    course.users.delete(student)
    redirect_to courses_path
  end
  
  def show_students
    course = Course.find(params[:id])
    @students = course.users.all
    
    render :nothing=>true
  end
end