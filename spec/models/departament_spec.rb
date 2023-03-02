require 'rails_helper'

RSpec.describe Department, type: :model do
  describe 'associations' do
    it { should have_many(:documents) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
