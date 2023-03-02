RSpec.describe User, type: :model do

  describe 'associations' do
    it { should belong_to(:position) }
    it { should have_many(:documents) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:second_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:position) }
    it { should validate_associated(:position) }
    it { should validate_length_of(:phone_number).is_at_least(5).is_at_most(20).allow_blank }
  end

  describe 'methods' do
    let(:user) { create(:user) }
    it 'should calculate the working time correctly' do
      expect(user.working_time).to eq(0.0)
    end
    it 'should generate a JWT' do
      jwt = user.generate_jwt
      expect(JWT.decode(jwt, Rails.application.secrets.secret_key_base)).to include({'id' => user.id})
    end
  end

end
