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
    redirect_to courses_path
  end
  
  def destroy
    course = Course.find(params[:id])
    course.destroy
    redirect_to courses_path
  end
  
  def update
    course = Course.find(params[:id])
    course.update_attributes(params[:course])
    redirect_to courses_path
  end
end