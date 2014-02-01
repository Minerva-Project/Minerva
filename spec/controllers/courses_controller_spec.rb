require 'spec_helper'

describe CoursesController do
  
  before :each do
    admin = FactoryGirl.create(:admin)
    sign_in :user, admin
  end

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
  
  describe "PUT update" do
    it "update a course" do
      course = Course.create(:title=>"Biology")
      course_params = {:title=>"Math"}
      post :update, :id=>course.id, :course=>course_params
      
      Course.last.title.should == "Math"
    end
  end
  
  describe "GET show" do
    it "show one course" do
      course = Course.create(:title=>"Biology")
      get :show, :id=>course.id
      
      assigns(:course).title.should == course.title
    end
  end
end
