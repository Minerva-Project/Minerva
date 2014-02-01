class CoursesController < ApplicationController
  
  def index
    @courses = Course.all
  end
  
  def new
    @course = Course.new
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
end