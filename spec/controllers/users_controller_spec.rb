require 'spec_helper'

describe UsersController do
  describe "POST create" do
    it "create a log note when a user is created" do
      admin = FactoryGirl.create(:admin)
      sign_in :user, admin
      user = {:password=>"12345678", :email=>"londerson@gmail.com", :first_name=>"Londerson", :role=>"student"}
      
      post :create, :user=> user
      
      User.all.size.should == 2
      User.last.first_name.should == "Londerson"
      Log.all.size.should == 1
    end
  end
end
