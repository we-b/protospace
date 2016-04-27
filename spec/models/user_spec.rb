require 'rails_helper'

describe User do
  describe '#create' do

    let(:user) { create(:user) }

    it "is valid with all information" do
      expect(build(:user)).to be_valid
    end

  end
end

