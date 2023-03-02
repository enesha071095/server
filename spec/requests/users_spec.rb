RSpec.describe Api::V1::UsersController, type: :controller do

  describe "GET #index_short" do
    it "returns a success response" do
      get :index_short
      expect(response).to be_successful
    end
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    context "when the user exists" do
      let!(:user) { create(:user) }

      it "returns a success response" do
        get :show, params: { id: user.id }
        expect(response).to be_successful
      end

      it "includes documents in the response" do
        create(:document, user: user)
        get :show, params: { id: user.id }
        expect(JSON.parse(response.body)['data']['documents']).not_to be_nil
      end
    end

    context "when the user does not exist" do
      it "returns a 401 status code and an error message" do
        get :show, params: { id: 0 }
        expect(response).to have_http_status(401)
        expect(JSON.parse(response.body)['message']).to eq("Couldn't find a user by specified ID")
      end
    end
  end
end
