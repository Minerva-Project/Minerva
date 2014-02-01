require 'spec_helper'

describe UsersController do
  describe "GET 'index'" do
    it "return all users" do
      user1 = User.create(:first_name=>"Londerson", :password=>"12345678", :email=>"londerson@gmail.com")
      user2 = User.create(:first_name=>"Londerson", :password=>"12345678", :email=>"jim@gmail.com")
      
      get :index
      assigns(:users).size.should == 2
    end
  end

  describe "POST 'create'" do
    it "create one user" do
      user_params = {:first_name=>"Londerson", :email=>"londerson@gmail.com", :password=>"12345678"}
      post :create, :user=>user_params
      User.all.size.should == 1
    end
  end

  describe "GET 'update'" do
    it "update date of user" do
      user = User.create(:first_name=>"Londerson", :email=>"londerson@gmail.com", :password=>"12345678")
      user_params = {:first_name=>"Marcus Fenix"}
      post :update, :id=>user.id, :user=>user_params
      
      User.last.first_name.should == "Marcus Fenix"
    end
  end

  describe "DELETE destroy" do
    it "delete a user created" do
      user = User.create(:first_name=>"Londerson", :password=>"12345678", :email=>"londerson@gmail.com")
      post :destroy, :id=>user.id
      
      User.all.size.should == 0
    end
  end
end
