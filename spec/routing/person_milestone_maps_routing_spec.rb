require "rails_helper"

RSpec.describe PersonMilestoneMapsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/person_milestone_maps").to route_to("person_milestone_maps#index")
    end

    it "routes to #new" do
      expect(get: "/person_milestone_maps/new").to route_to("person_milestone_maps#new")
    end

    it "routes to #show" do
      expect(get: "/person_milestone_maps/1").to route_to("person_milestone_maps#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/person_milestone_maps/1/edit").to route_to("person_milestone_maps#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/person_milestone_maps").to route_to("person_milestone_maps#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/person_milestone_maps/1").to route_to("person_milestone_maps#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/person_milestone_maps/1").to route_to("person_milestone_maps#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/person_milestone_maps/1").to route_to("person_milestone_maps#destroy", id: "1")
    end
  end
end
