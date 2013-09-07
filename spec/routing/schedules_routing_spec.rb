require "spec_helper"

describe SchedulesController do
  describe "routing" do

    it "routes to #index" do
      get("/courses/1/schedules").should route_to("schedules#index", course_id: "1")
    end

    it "routes to #new" do
      get("/courses/1/schedules/new").should route_to("schedules#new", course_id: "1")
    end

    it "routes to #show" do
      get("/courses/1/schedules/1").should route_to("schedules#show", course_id: "1", id: "1")
    end

    it "routes to #edit" do
      get("/courses/1/schedules/1/edit").should route_to("schedules#edit", course_id: "1", id: "1")
    end

    it "routes to #create" do
      post("/courses/1/schedules").should route_to("schedules#create", course_id: "1")
    end

    it "routes to #update" do
      put("/courses/1/schedules/1").should route_to("schedules#update", course_id: "1", id: "1")
    end

    it "routes to #destroy" do
      delete("/courses/1/schedules/1").should route_to("schedules#destroy", course_id: "1", id: "1")
    end

  end
end
