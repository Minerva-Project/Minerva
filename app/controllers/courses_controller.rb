require 'pp'

class CoursesController < ApplicationController
#before_filter {|controller| controller.only_for('administrator') }
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

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'O curso foi criado corretamente.' }
        format.json { render json: @course, status: :created, location: @course }
      else
        format.html { render action: "new" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to @course, notice: 'O curso foi atualizado corretamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
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