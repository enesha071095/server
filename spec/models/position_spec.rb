RSpec.describe Position, type: :model do
  subject { described_class.new(name: 'Manager') }

  describe 'associations' do
    it { should have_many(:users) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
