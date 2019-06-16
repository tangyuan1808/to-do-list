require 'rails_helper'

describe ToDo, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:list) { FactoryBot.create(:list, user_id: user.id) }
  let(:to_do) { FactoryBot.build(:to_do, user_id: user.id, list_id: list.id) }

  describe 'validation' do
    subject { to_do.valid? }

    it { is_expected.to be true }

    context 'name must be present' do
      before :each do
        to_do.name = nil
      end

      it { is_expected.to eq false }

      it 'contains the correct error message' do
        subject

        expect(to_do.errors.messages[:name]).to eq(['不能是空白的'])
      end
    end

    context 'name can not exceed 32 characters' do
      before :each do
        long_name = 'abcabcabcabcabcabcabcabcabcabcabcabcabcabc'
        to_do.name = long_name
      end

      it { is_expected.to eq false }

      it 'contains the correct error message' do
        subject

        expect(to_do.errors.messages[:name]).to eq(['太长（最多32个字符)'])
      end
    end
  end
end
