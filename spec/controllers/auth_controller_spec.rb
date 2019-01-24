RSpec.describe AuthController do
  context 'auth' do
    before(:each) { post :create }
    let(:payload) { Auth.decode(json['jwt']) }

    it { expect(response).to have_http_status(:success) }
    it { expect(payload).to have_key('user') }
    it { expect(payload).to have_key('exp') }
  end
end
