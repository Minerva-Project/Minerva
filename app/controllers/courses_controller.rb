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
    @course = Course.new(params[:course])

    if @course.save
      redirect_to @course, notice: 'O curso foi criado corretamente.'
    else
      render action: "new"
    end
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
    @course = Course.find(params[:id])
    @course.destroy

    redirect_to courses_url
  end

  def map
    @name = User.all.map{ |u| if u.role == 'teacher' and u.first_name != nil; u.first_name + " #{u.last_name}" ; end; }.compact
  end

  def add
    user = User.find(params[:user_id])
    course = Course.find(params[:id])
    course.users << user
    redirect_to course, notice: "Criado"
  end

  def remove
    user = User.find(params[:user_id])
    course = Course.find(params[:id])

    if  course.users.destroy user
      redirect_to course, notice: "Removido"
    end
  end
end
