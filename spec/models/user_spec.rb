require 'rails_helper'

describe User do
  describe '#create' do

    let(:user) { create(:user) }

    it "is valid with all information" do
      expect(build(:user)).to be_valid
    end

    it "is invalid without a name" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

  end
end

