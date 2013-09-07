require "spec_helper"

describe ProfilesController do
  describe "routing" do

    it "routes to #index" do
      get("/users/1/profiles").should route_to("profiles#index", :user_id =>"1")
    end

    it "routes to #new" do
      get("/users/1/profiles/new").should route_to("profiles#new",:user_id => "1")
    end

    it "routes to #show" do
      get("/users/1/profiles/1").should route_to("profiles#show", :user_id => "1", :id => "1")
    end

    it "routes to #edit" do
      get("/users/1/profiles/1/edit").should route_to("profiles#edit", :user_id => "1", :id => "1")
    end

    it "routes to #create" do
      post("/users/1/profiles").should route_to("profiles#create", :user_id => "1")
    end

    it "routes to #update" do
      put("/users/1/profiles/1").should route_to("profiles#update", :user_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      delete("/users/1/profiles/1").should route_to("profiles#destroy", :user_id => "1", :id => "1")
    end

  end
end
