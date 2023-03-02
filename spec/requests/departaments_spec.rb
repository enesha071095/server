require 'rails_helper'

RSpec.describe Api::V1::DepartamentsController, type: :controller do
  describe "GET #index" do
    let!(:departament1) { create(:departament) }
    let!(:departament2) { create(:departament) }

    before do
      get :index
    end

    it "returns a successful response" do
      expect(response).to have_http_status(:ok)
    end

    it "returns all departaments" do
      expect(assigns(:data)).to eq(DepartamentSerializer.new([departament1, departament2]).serializable_hash)
    end
  end
end
