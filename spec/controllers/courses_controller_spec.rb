require 'spec_helper'

describe CoursesController do

  describe "GET 'index'" do
    it "return all courses created" do
      course1 = Course.create(:title=>"Biology")
      course2 = Course.create(:title=>"Math")
      
      get 'index'
      assigns(:courses).size.should == 2
    end
  end
  
  describe "POST create" do
    it "create a new course" do
      course = {:title=>"Biology"}
      post :create, :course=>course
      Course.all.size.should == 1
    end
  end
  
  describe "DELETE destroy" do
    it "destroy a course created" do
      course = Course.create(:title=>"Biology")
      post :destroy, :id=>course.id
      
      Course.all.size.should == 0
    end
  end
end
