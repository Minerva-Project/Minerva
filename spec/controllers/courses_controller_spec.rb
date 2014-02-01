require 'spec_helper'

describe CoursesController do
  before :each do 
    admin = FactoryGirl.create(:admin)  
    sign_in :user, admin
  end
  
  describe "POST create " do
    it "when create a course create a log too" do
      course = {:title=>"Biology"}

      post :create, :course=>course
      Course.all.size.should == 1
      Log.all.size.should == 1
    end
  end
  
  describe "POST destroy" do
    it "when a course is destroyed create a log" do
      course = Course.create(:title=>"Biology")
      Course.all.size.should == 1
      
      post :destroy, :id=>course.id
      Course.all.size.should == 0
      Log.all.size.should == 1
    end
  end
  
  # describe "POST add" do
  #   user = User.create(:email=>"student@gmail.com", :password=>"12345678", :role=>"student")
  #   course = Course.create(:title=>"Biology")
    
  #   get :add, :user_id=>user.id, :id=>course.id
  #   course.students.last.size = 1
  # end
  
  # describe "POST add" do
  #   user = User.create(:email=>"student@gmail.com", :password=>"12345678", :role=>"student")
  #   course = Course.create(:title=>"Biology")
    
  #   delete :remove, :user_id=>user.id, :id=>course.id
  #   course.students.last.size = 1
  # end  
end
