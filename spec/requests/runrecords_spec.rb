require 'rails_helper'

RSpec.describe "Runrecords", type: :request do
  describe "GET /runrecords" do
    it "works! (now write some real specs)" do
      get runrecords_path
      expect(response).to have_http_status(200)
    end
  end
end
