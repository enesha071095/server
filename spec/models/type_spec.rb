RSpec.describe Type, type: :model do
  subject { described_class.new(name: 'Some Name') }

  describe 'associations' do
    it { is_expected.to have_many(:documents) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
