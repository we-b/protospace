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

    it "is invalid without an email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "0000000000")
      user.valid?
      expect(user.errors[:password_confirmation][0]).to include("doesn't match Password")
    end

  end
end

