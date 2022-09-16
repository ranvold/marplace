require "rails_helper"

RSpec.describe SubmodelsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/submodels").to route_to("submodels#index")
    end

    it "routes to #new" do
      expect(get: "/submodels/new").to route_to("submodels#new")
    end

    it "routes to #show" do
      expect(get: "/submodels/1").to route_to("submodels#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/submodels/1/edit").to route_to("submodels#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/submodels").to route_to("submodels#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/submodels/1").to route_to("submodels#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/submodels/1").to route_to("submodels#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/submodels/1").to route_to("submodels#destroy", id: "1")
    end
  end
end
