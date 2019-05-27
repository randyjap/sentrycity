require "rails_helper"

RSpec.describe CommentsController do
  let(:user) { FactoryBot.build :user }

  let(:comment_1) { FactoryBot.create :comment, user: user }
  let(:comment_2) { FactoryBot.create :comment }
  let(:params_1) { { id: comment_1.id } }
  let(:params_2) { { id: comment_2.id } }
  let(:comment_vote) { { comment_vote: { vote: vote } } }

  context "when logged in" do
    before { log_in(user) }
    describe "DELETE #destroy" do
      it "returns ok status with valid ownership" do
        delete :destroy, params: params_1, format: :js
        expect(response.status).to be(200)
      end

      it "returns unauthorized WITHOUT valid ownership" do
        delete :destroy, params: params_2, format: :js
        expect(response.status).to be(401)
      end
    end

    %w(1 -1).each do |vote|
      let(:vote) { vote }

      describe "POST #comment_vote" do
        it "returns ok status with valid ownership" do
          post :comment_vote, params: params_1.merge(comment_vote), format: :js
          expect(response.status).to be(200)
        end

        it "returns unauthorized WITHOUT valid ownership" do
          post :comment_vote, params: params_2.merge(comment_vote), format: :js
          expect(response.status).to be(401)
        end
      end
    end
  end

  context "when NOT logged in" do
    describe "DELETE #destroy" do
      it "returns unauthorized" do
        delete :destroy, params: params_1, format: :js
        expect(response.status).to be(401)
      end
    end

    %w(1 -1).each do |vote|
      let(:vote) { vote }

      describe "POST #comment_vote" do
        it "returns unauthorized" do
          post :comment_vote, params: params_1.merge(comment_vote), format: :js
          expect(response.status).to be(401)
        end
      end
    end
  end
end