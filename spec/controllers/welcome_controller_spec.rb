require "rails_helper"

RSpec.shared_examples "assigns required instance variables" do
  it "assigns required farewell_stores instance variables" do
    expect(assigns(:farewell_stores)).not_to be_nil
  end

  it "assigns required grand_openings instance variables" do
    expect(assigns(:grand_openings)).not_to be_nil
  end
end

RSpec.describe WelcomeController do
  let(:user) { FactoryBot.build :user }

  describe "GET #index" do
    before { get :index }

    context "when logged in" do
      before { log_in(user) }

      it "returns status ok" do
        expect(response.status).to be(200)
      end

      include_examples("assigns required instance variables")
    end

    context "when NOT logged in" do
      it "returns status ok" do
        expect(response.status).to be(200)
      end

      include_examples("assigns required instance variables")
    end
  end
end