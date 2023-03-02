RSpec.describe Api::V1::Users::SessionsController, type: :controller do
  describe 'POST #create' do
    let!(:user) { create(:user) }

    context 'when user provides valid credentials' do
      it 'responds with status 200' do
        post :create, params: { user: { email: user.email, password: user.password } }

        expect(response).to have_http_status(:ok)
      end

      it 'returns a JSON response with auth token, user id, and admin status' do
        post :create, params: { user: { email: user.email, password: user.password } }

        json_response = JSON.parse(response.body)

        expect(json_response).to have_key('token')
        expect(json_response).to have_key('user_id')
        expect(json_response).to have_key('is_admin')
      end
    end

    context 'when user provides invalid credentials' do
      it 'responds with status 422' do
        post :create, params: { user: { email: user.email, password: 'invalid_password' } }

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns a JSON response with error message' do
        post :create, params: { user: { email: user.email, password: 'invalid_password' } }

        json_response = JSON.parse(response.body)

        expect(json_response).to have_key('errors')
      end
    end
  end
end
