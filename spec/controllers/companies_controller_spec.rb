RSpec.describe CompaniesController, type: :controller do
  before(:each) { authenticated_header(request) }
  let(:company) { create(:company) }

  context 'index' do
    before(:each) { get :index }
    it { expect(response).to have_http_status(:success) }
  end

  context 'show' do
    before(:each) { get :show, params: { id: company.id } }
    it { expect(response).to have_http_status(:success) }
  end

  context 'create' do
    before(:each) { get :create, params: company_params }

    context 'success' do
      let(:company_params) { { company: build(:company).as_json } }

      it { expect(response).to have_http_status(:success) }
    end

    context 'unprocessable_entity' do
      let(:company_params) { { company: build(:company, name: nil).as_json } }

      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end

  context 'update' do
    before(:each) { put :update, params: company_params }

    context 'success' do
      let(:company_params) { { id: company.id, company: { name: 'New name' } } }

      it { expect(response).to have_http_status(:success) }
    end

    context 'unprocessable_entity' do
      let(:company_params) { { id: company.id, company: { name: nil } } }

      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end

  context 'destroy' do
    before(:each) { delete :destroy, params: { id: company.id } }
    it { expect(response).to have_http_status(:success) }
  end

  context 'csv' do
    before(:each) { get :csv }
    it { expect(response.header['Content-Type']).to include 'text/csv' }
  end
end
