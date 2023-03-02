require 'rails_helper'

RSpec.describe Signature, type: :model do

  describe 'associations' do
    it { should belong_to(:document) }
    it { should have_one(:user).through(:document) }
  end

  describe 'callbacks' do
    describe 'before_create' do
      context 'when token is blank' do
        let(:signature) { build(:signature, token: nil) }

        it 'generates a token' do
          expect { signature.save }.to change { signature.token }.from(nil).to(a_string_matching(/^[0-9a-f]{20}$/))
        end
      end

      context 'when token is present' do
        let(:signature) { build(:signature, token: 'abc123') }

        it 'does not change the token' do
          expect { signature.save }.not_to change { signature.token }
        end
      end
    end
  end

end
