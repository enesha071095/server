require 'rails_helper'

RSpec.describe Api::V1::TypesController, type: :controller do

  describe 'GET #index' do
    before do
      FactoryBot.create_list(:type, 3)
      get :index
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns all types' do
      json_response = JSON.parse(response.body)
      expect(json_response['data'].size).to eq(3)
    end
  end
end
