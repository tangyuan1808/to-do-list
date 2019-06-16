require 'rails_helper'

describe List, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:list) { FactoryBot.build(:list, user_id: user.id) }

  describe 'validation' do
    subject { list.valid? }

    it { is_expected.to be true }

    context 'name must be present' do
      before :each do
        list.name = nil
      end

      it { is_expected.to eq false }

      it 'contains the correct error message' do
        subject

        expect(list.errors.messages[:name]).to eq(['不能是空白的'])
      end
    end

    context 'name can not exceed 32 characters' do
      before :each do
        long_name = 'abcabcabcabcabcabcabcabcabcabcabcabcabcabc'
        list.name = long_name
      end

      it { is_expected.to eq false }

      it 'contains the correct error message' do
        subject

        expect(list.errors.messages[:name]).to eq(['太长（最多32个字符)'])
      end
    end
  end
end
