class ClassesController < ApplicationController
before_filter :find_class
  def index
    #@course = Course.find(params[:id])
  end

  def manage_class
    @course = Course.find(params[:id])
  end

  def find_class
    #@class = @user.courses.find(params[:id])
  end

  def method_name
    
  end


end
