require "rails_helper"

RSpec.describe RunrecordsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/runrecords").to route_to("runrecords#index")
    end

    it "routes to #new" do
      expect(:get => "/runrecords/new").to route_to("runrecords#new")
    end

    it "routes to #show" do
      expect(:get => "/runrecords/1").to route_to("runrecords#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/runrecords/1/edit").to route_to("runrecords#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/runrecords").to route_to("runrecords#create")
    end

    it "routes to #update" do
      expect(:put => "/runrecords/1").to route_to("runrecords#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/runrecords/1").to route_to("runrecords#destroy", :id => "1")
    end

  end
end
