require 'rails_helper'

describe Prototype do
  describe '#create' do
    context "with valid attributes" do
      it "is valid with title, catch_copy and concept" do
        expect(build(:prototype)).to be_valid
      end
    end
  end
end
