require "spec_helper"

describe NoticesController do
  describe "routing" do

    it "routes to #index" do
      get("/courses/1/notices").should route_to("notices#index", :course_id => "1")
    end

    it "routes to #new" do
      get("/courses/1/notices/new").should route_to("notices#new", :course_id => "1")
    end

    it "routes to #show" do
      get("/courses/1/notices/1").should route_to("notices#show", :course_id => "1", :id => "1")
    end

    it "routes to #edit" do
      get("/courses/1/notices/1/edit").should route_to("notices#edit", :course_id => "1", :id => "1")
    end

    it "routes to #create" do
      post("/courses/1/notices").should route_to("notices#create", :course_id => "1")
    end

    it "routes to #update" do
      put("/courses/1/notices/1").should route_to("notices#update", :course_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      delete("/courses/1/notices/1").should route_to("notices#destroy", :course_id => "1", :id => "1")
    end

  end
end
