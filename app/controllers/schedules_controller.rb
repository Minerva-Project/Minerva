class SchedulesController < ApplicationController
  before_filter :find_course

  def index
    @schedules = Schedule.all
  end

  def show
    @schedule = Schedule.find_by_id(params[:id])
  end

  def new
    @schedule = Schedule.new
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def create
    course = Course.find(params[:course_id])
    @schedule = Schedule.new(params[:schedule])
    @schedule.course = course

    if @schedule.save
       redirect_to course_path(course), notice: 'Schedule was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @schedule = Schedule.find(params[:id])

    if @schedule.update_attributes(params[:schedule])
     redirect_to course_schedule_path(@course), notice: 'Schedule was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy

    redirect_to course_schedule_path(@course)
  end

  def find_course
    @course = Course.find(params[:course_id])
  end
end