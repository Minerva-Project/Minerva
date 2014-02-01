require 'spec_helper'

describe UsersController do
  before :each do
    admin = FactoryGirl.create(:admin)
    sign_in :user, admin
  end
  
  describe "GET 'index'" do
    it "return all users" do
      user1 = User.create(:first_name=>"Londerson", :password=>"12345678", :email=>"londerson@gmail.com")
      user2 = User.create(:first_name=>"Londerson", :password=>"12345678", :email=>"jim@gmail.com")
      
      get :index
      assigns(:users).size.should == 3
    end
  end

  describe "POST 'create'" do
    it "create one user" do
      user_params = {:first_name=>"Londerson", :email=>"londerson@gmail.com", :password=>"12345678"}
      post :create, :user=>user_params
      User.all.size.should == 2
    end
    
    it "create a log when create a new user" do
      user_params = {:first_name=>"Londerson", :password=>"12345678", :email=>"londerson@gmail.com"}
      post :create, :user=>user_params
      
      Log.all.size.should == 1
    end
  end

  describe "GET 'update'" do
    it "update date of user" do
      user = User.create(:first_name=>"Londerson", :email=>"londerson@gmail.com", :password=>"12345678")
      user_params = {:first_name=>"Marcus Fenix"}
      
      post :update, :id=>user._id, :user=>user_params
      
      User.last.first_name.should == "Marcus Fenix"
    end
  end

  describe "DELETE destroy" do
    it "delete a user created" do
      user = User.create(:first_name=>"Londerson", :password=>"12345678", :email=>"londerson@gmail.com")
      post :destroy, :id=>user.id
      
      User.all.size.should == 1
    end
    
    it "when delete a user create a log" do
      user = FactoryGirl.create(:student)
      post :destroy, :id=>user.id
      
      Log.all.size.should == 1
    end
  end
  
  describe "GET students_association" do
    it "show all students available for association in any course" do
      student1 = FactoryGirl.create(:student)
      student2 = FactoryGirl.create(:student)
      
      get :students_association
      
      assigns(:students).size.should == 2
      assigns(:students).last.email.should == student2.email
    end
  end
end
