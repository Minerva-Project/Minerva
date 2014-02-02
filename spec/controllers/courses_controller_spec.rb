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
    
    it "when create a new course create a log" do
      course = {:title=>"Biology"}
      post :create, :course=>course
      
      Log.all.size.should == 1
    end
  end
  
  describe "DELETE destroy" do
    it "destroy a course created" do
      course = Course.create(:title=>"Biology")
      post :destroy, :id=>course.id
      
      Course.all.size.should == 0
    end
    
    it "when destroy a course create a log" do
      course = FactoryGirl.create(:course)
      post :destroy, :id=>course.id
      
      Log.all.size.should == 1
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
  
  it "include one student in a course" do    
    course = FactoryGirl.create(:course)
    student = FactoryGirl.create(:student)
    
    post :include_student, :id=>course.id, :user_id=>student.id
    
    course.reload.users.all.size.should == 1
  end
  
  it "remove one student of course" do
    course = FactoryGirl.create(:course)
    student = FactoryGirl.create(:student)
    course.users << course
    course.save
    
    post :remove_student, :id=>course.id, :user_id=>student.id
    course.reload.users.all.size.should == 0
  end
  
    describe "GET show_students" do
      it "show students of one course" do
        course = Course.create(:title=>"Biology")
        student1 = FactoryGirl.create(:student)
        student2 = FactoryGirl.create(:student)
        
        course.users << student1
        course.users << student2
        course.save
        
        get :show_students, :id=>course.id
        assigns(:students).size.should == 2
      end
    end
end
