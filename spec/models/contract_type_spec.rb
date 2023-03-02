require 'rails_helper'

RSpec.describe ContractType, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
