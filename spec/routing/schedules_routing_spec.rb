require "spec_helper"

describe SchedulesController do
  describe "routing" do

    it "routes to #index" do
      get("/schedules").should route_to("schedules#index")
    end

    it "routes to #new" do
      get("/schedules/new").should route_to("schedules#new")
    end

    it "routes to #show" do
      get("/schedules/1").should route_to("schedules#show", :id => "1")
    end

    it "routes to #edit" do
      get("/schedules/1/edit").should route_to("schedules#edit", :id => "1")
    end

    it "routes to #create" do
      post("/schedules").should route_to("schedules#create")
    end

    it "routes to #update" do
      put("/schedules/1").should route_to("schedules#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/schedules/1").should route_to("schedules#destroy", :id => "1")
    end

  end
end
