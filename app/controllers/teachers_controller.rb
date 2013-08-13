class TeachersController < ApplicationController

  def show_courses
    @user = current_user
  end

end