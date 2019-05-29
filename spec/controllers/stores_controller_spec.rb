require "rails_helper"

RSpec.describe StoresController do
  let(:user) { FactoryBot.create :user }

  let(:store_1) { FactoryBot.create :store, user: user }
  let(:store_2) { FactoryBot.create :store }
  let(:draft_store) { FactoryBot.create :store, state: 'draft' }
  let(:params_1) { { id: store_1.id } }
  let(:params_2) { { id: store_2.id } }
  let(:update_params) { { next_form_no: 2, store_params: { name: '' } } }
  let(:comment_params) { { comment: { text: '' } } }
  let(:comment_vote) { { store_vote: { vote: vote } } }

  context "when logged in" do
    before { log_in(user) }

    describe "POST #bookmark" do
      it "returns ok status with valid ownership" do
        post :bookmark, params: params_1, format: :js
        expect(response.status).to eq(200)
      end

      it "returns unauthorized WITHOUT valid ownership" do
        post :bookmark, params: params_2, format: :js
        expect(response.status).to eq(401)
      end
    end

    describe "POST #comments" do
      it "returns ok status with params" do
        post :comments, params: comment_params.merge(params_1), format: :js
        expect(response.status).to eq(200)
      end

      it "returns ok WITHOUT valid ownership" do
        post :comments, params: comment_params.merge(params_2), format: :js
        expect(response.status).to eq(200)
      end
    end

    describe "POST #create_a_store" do
      it "returns ok status without params" do
        post :create_a_store, params: {}, format: :js
        expect(response.status).to eq(200)
      end
    end

    describe "GET #show" do
      it "returns ok status with valid ownership" do
        get :show, params: params_1, format: :js
        expect(response.status).to eq(200)
      end

      it "returns ok WITHOUT valid ownership" do
        get :show, params: params_2, format: :js
        expect(response.status).to eq(200)
      end
    end

    %w(1 -1).each do |vote|
      let(:vote) { vote }

      describe "POST #store_vote" do
        it "returns ok status with valid ownership" do
          post :store_vote, params: params_1.merge(comment_vote), format: :js
          expect(response.status).to be(200)
        end

        it "returns ok WITHOUT valid ownership" do
          post :store_vote, params: params_2.merge(comment_vote), format: :js
          expect(response.status).to be(200)
        end
      end
    end

    describe "PATCH #update_create_a_store" do
      it "returns ok status with params" do
        log_in(draft_store.user)
        patch :update_create_a_store, params: update_params, format: :js
        expect(response.status).to eq(200)
      end

      it "returns not found WITHOUT valid ownership" do
        patch :update_create_a_store, params: update_params, format: :js
        expect(response.status).to eq(404)
      end
    end
  end

  context "when NOT logged in" do
    describe "POST #bookmark" do
      it "redirects to login screen" do
        post :bookmark, params: params_1, format: :js
        expect(response).to redirect_to(new_user_session_url)
      end
    end

    describe "POST #comments" do
      it "redirects to login screen" do
        post :comments, params: comment_params.merge(params_1), format: :js
        expect(response).to redirect_to(new_user_session_url)
      end
    end

    describe "POST #create_a_store" do
      it "redirects to login screen" do
        post :create_a_store, params: {}, format: :js
        expect(response).to redirect_to(new_user_session_url)
      end
    end

    describe "GET #show" do
      it "redirects to login screen" do
        get :show, params: params_1, format: :js
        expect(response).to redirect_to(new_user_session_url)
      end
    end

    %w(1 -1).each do |vote|
      let(:vote) { vote }

      describe "POST #store_vote" do
        it "redirects to login screen" do
          post :store_vote, params: params_1.merge(comment_vote), format: :js
          expect(response).to redirect_to(new_user_session_url)
        end
      end
    end

    describe "PATCH #update_create_a_store" do
      it "redirects to login screen" do
        patch :update_create_a_store, params: update_params, format: :js
        expect(response).to redirect_to(new_user_session_url)
      end
    end
  end
end