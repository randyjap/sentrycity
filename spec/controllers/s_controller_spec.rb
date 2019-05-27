require "rails_helper"

RSpec.describe SController do
  let :search_params do
    {
      "search_params"=>{
      "search_text"=>"pan",
      "district_ids"=>["1"],
      "tag_ids"=>["1"],
      "event_types"=>["Farewell Sale"]},
      "controller"=>"s",
      "action"=>"search"
    }
  end

  describe "GET #index" do
    it "returns status ok with search parameters" do
      get :index, params: search_params

      expect(response.status).to be(200)
    end

    it "returns status ok WITHOUT search parameters" do
      get :index

      expect(response.status).to be(200)
    end
  end

  describe "POST #index" do
    it "returns status ok with search parameters" do
      post :search, params: search_params, format: :js

      expect(response.status).to be(200)
    end

    it "returns status ok WITHOUT search parameters" do
      post :search, format: :js

      expect(response.status).to be(200)
    end
  end
end