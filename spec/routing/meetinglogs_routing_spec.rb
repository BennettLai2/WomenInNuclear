require "rails_helper"

RSpec.describe MeetinglogsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/meetinglogs").to route_to("meetinglogs#index")
    end

    it "routes to #new" do
      expect(get: "/meetinglogs/new").to route_to("meetinglogs#new")
    end

    it "routes to #show" do
      expect(get: "/meetinglogs/1").to route_to("meetinglogs#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/meetinglogs/1/edit").to route_to("meetinglogs#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/meetinglogs").to route_to("meetinglogs#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/meetinglogs/1").to route_to("meetinglogs#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/meetinglogs/1").to route_to("meetinglogs#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/meetinglogs/1").to route_to("meetinglogs#destroy", id: "1")
    end
  end
end
