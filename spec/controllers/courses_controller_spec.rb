require 'spec_helper'

describe CoursesController do
  describe "POST create " do
    it "when create a course create a log too" do
      admin = FactoryGirl.create(:admin)
      sign_in :user, admin
      
      course = {:title=>"Biology"}

      post :create, :course=>course
      Course.all.size.should == 1
      Log.all.size.should == 1
    end
  end
  
  describe "POST destroy" do
    it "when a course is destroyed create a log" do
      admin = FactoryGirl.create(:admin)
      sign_in :user, admin
      
      course = Course.create(:title=>"Biology")
      Course.all.size.should == 1
      
      post :destroy, :id=>course.id
      Course.all.size.should == 0
      Log.all.size.should == 1
    end
  end
end
