RSpec.describe ClaimsController, type: :controller do
  before(:each) { authenticated_header(request) }
  let(:claim) { create(:claim) }

  context 'index' do
    before(:each) { get :index }
    it { expect(response).to have_http_status(:success) }
  end

  context 'show' do
    before(:each) { get :show, params: { id: claim.id } }
    it { expect(response).to have_http_status(:success) }
  end

  context 'create' do
    before(:each) { get :create, params: claim_params }

    context 'success' do
      let!(:claim_params) { { claim: build(:claim).as_json } }

      it { expect(response).to have_http_status(:success) }
    end

    context 'unprocessable_entity' do
      let!(:claim_params) { { claim: build(:claim, percentage_drop: nil).as_json } }

      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end

    context 'update' do
    before(:each) { put :update, params: claim_params }

    context 'success' do
      let(:claim_params) { { id: claim.id, claim: { percentage_drop: 100 } } }

      it { expect(response).to have_http_status(:success) }
    end

    context 'unprocessable_entity' do
      let(:claim_params) { { id: claim.id, claim: { percentage_drop: nil } } }

      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end

  context 'destroy' do
    before(:each) { delete :destroy, params: { id: claim.id } }
    it { expect(response).to have_http_status(:success) }
  end
end
