RSpec.describe ApplicationController, type: :controller do
  controller do
    def index
      head :ok
    end
  end

  it 'valid token' do
    jwt = Auth.issue({})
    request.headers.merge!('Authorization': "Bearer #{jwt}")
    get :index
    expect(response).to have_http_status(:success)
  end

  it 'invalid token' do
    get :index
    expect(json['error']).to eq('Bearer token not provided')
  end

  it 'invalid token' do
    request.headers.merge!('Authorization': "Bearer invalid")
    get :index
    expect(json['error']).to eq('Bearer token is invalid')
  end

  it 'expired token' do
    jwt = Auth.issue({}, 1.minute.ago)
    request.headers.merge!('Authorization': "Bearer #{jwt}")
    get :index
    expect(json['error']).to eq('Bearer token is expired')
  end
end
