require 'rails_helper'

RSpec.describe Api::V1::CurrenciesController, type: :controller do
  describe 'GET #index' do
    let!(:currency1) { create(:currency) }
    let!(:currency2) { create(:currency) }

    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'returns a list of currencies' do
      get :index
      expect(JSON.parse(response.body)['data'].size).to eq(2)
    end

    it 'returns the correct data for each currency' do
      get :index
      json_response = JSON.parse(response.body)['data']
      expect(json_response.map { |j| j['id'] }).to include(currency1.id.to_s, currency2.id.to_s)
      expect(json_response.map { |j| j['attributes']['name'] }).to include(currency1.name, currency2.name)
    end
  end
end
