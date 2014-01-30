require 'spec_helper'

describe ManageController do
  describe "GET index" do    
    it "after login redirect redirect to admin home" do
      admin = FactoryGirl.create(:admin)
      sign_in :user, admin

      get 'index'
      response.should redirect_to admin_path
    end
    
    it "after login redirect redirect to student home" do
      student = FactoryGirl.create(:student)
      sign_in :user, student

      get 'index'
      response.should redirect_to student_path
    end
    
    it "after login redirect redirect to teacher home" do
      teacher = FactoryGirl.create(:teacher)
      sign_in :user, teacher

      get 'index'
      response.should redirect_to teacher_path
    end
  end
end
