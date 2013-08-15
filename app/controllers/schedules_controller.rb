class SchedulesController < ApplicationController
  before_filter :load_course

  def index
    @schedules = Schedule.all
  end

  def show
    @schedule = Schedule.new
    id = @course.id
    @schedule = Schedule.find_by_id(id)

    if @schedule == nil
      render 'new'
    else

    end
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

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to manage_class_path(course), notice: 'Schedule was successfully created.' }
        format.json { render json: @schedule, status: :created, location: @schedule }
      else
        format.html { render action: "new" }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /schedules/1
  # PUT /schedules/1.json
  def update
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      if @schedule.update_attributes(params[:schedule])
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @course = Course.find(params[:course_id])
    @schedule = Schedule.find(params[:id])
    @schedule.destroy

    respond_to do |format|
      format.html { redirect_to course_schedule_path(@course)  }
      format.json { head :no_content }
    end
  end

  def load_course
    @course = Course.find(params[:course_id])
  end
end
