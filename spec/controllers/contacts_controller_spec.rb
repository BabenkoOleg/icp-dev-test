RSpec.describe ContactsController, type: :controller do
  before(:each) { authenticated_header(request) }
  let(:contact) { create(:contact) }

  context 'index' do
    before(:each) { get :index }
    it { expect(response).to have_http_status(:success) }
  end

  context 'show' do
    before(:each) { get :show, params: { id: contact.id } }
    it { expect(response).to have_http_status(:success) }
  end

  context 'create' do
    before(:each) { get :create, params: contact_params }

    context 'success' do
      let!(:contact_params) { { contact: build(:contact).as_json } }

      it { expect(response).to have_http_status(:success) }
    end

    context 'unprocessable_entity' do
      let!(:contact_params) { { contact: build(:contact, name: nil).as_json } }

      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end

    context 'update' do
    before(:each) { put :update, params: contact_params }

    context 'success' do
      let(:contact_params) { { id: contact.id, contact: { name: 'New name' } } }

      it { expect(response).to have_http_status(:success) }
    end

    context 'unprocessable_entity' do
      let(:contact_params) { { id: contact.id, contact: { name: nil } } }

      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end

  context 'destroy' do
    before(:each) { delete :destroy, params: { id: contact.id } }
    it { expect(response).to have_http_status(:success) }
  end
end
