class ManageController < ApplicationController
  
  def index
    case current_user.role
    when "admin"
      redirect_to admin_path
    when "teacher"
      redirect_to teacher_path
    when "student"
      redirect_to student_path
    end
  end
end
