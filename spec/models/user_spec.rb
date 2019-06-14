require 'rails_helper'

describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }

  describe 'validation' do
    subject { user.valid? }

    it { is_expected.to be true }

    context 'email must be present' do
      before :each do
        user.email = nil
      end

      it { is_expected.to eq false }

      it 'contains the correct error message' do
        subject

        expect(user.errors.messages[:email]).to eq(["can't be blank"])
      end
    end

    context 'email must be unique' do
      before :each do
        FactoryBot.create(:user, email: user.email)
      end

      it { is_expected.to eq false }

      it 'contains the correct error message' do
        subject

        expect(user.errors.messages[:email]).to eq(["has already been taken"])
      end
    end

    context 'name must be present' do
      before :each do
        user.name = nil
      end

      it { is_expected.to eq false }

      it 'contains the correct error message' do
        subject

        expect(user.errors.messages[:name]).to eq(["can't be blank"])
      end
    end

    context 'name must be unique' do
      before :each do
        FactoryBot.create(:user, name: user.name)
      end

      it { is_expected.to eq false }

      it 'contains the correct error message' do
        subject

        expect(user.errors.messages[:name]).to eq(["has already been taken"])
      end
    end
  end
end