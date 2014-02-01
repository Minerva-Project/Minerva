require 'spec_helper'

describe LogsController do

  before :each do 
    admin = FactoryGirl.create(:admin)
    sign_in :user, admin  
  end
  
  describe "GET 'index'" do
    it "return all logs" do
      log1 = Log.create(:body=>"Log 1")
      log2 = Log.create(:body=>"Log2")
      
      get :index
      
      assigns(:logs).size.should == 2
    end
  end

end
