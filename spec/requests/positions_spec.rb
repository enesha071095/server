RSpec.describe Api::V1::PositionsController, type: :controller do
  describe "GET #index" do
    before do
      create_list(:position, 3)
      get :index
    end

    it "returns a successful response" do
      expect(response).to have_http_status(:ok)
    end

    it "returns positions data in JSON format" do
      positions = PositionSerializer.new(Position.all).serializable_hash
      expect(JSON.parse(response.body)["data"]).to match_array(positions)
    end
  end
end
