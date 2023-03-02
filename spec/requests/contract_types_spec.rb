require 'rails_helper'

RSpec.describe Api::V1::ContractTypesController, type: :controller do
  describe 'GET #index' do
    let!(:contract_types) { create_list(:contract_type, 3) }

    before { get :index }

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns a JSON response with contract types' do
      expect(JSON.parse(response.body)['data'].size).to eq(3)
    end
  end
end
