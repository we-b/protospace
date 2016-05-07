require 'rails_helper'

describe Prototype do
  describe '#create' do
    context "with valid attributes" do
      it "is valid with title, catch_copy and concept" do
        expect(build(:prototype)).to be_valid
      end
    end

    context "without valid attributes" do
      it "is invalid without a title" do
        prototype = build(:prototype, title: nil)
        prototype.valid?
        expect(prototype.errors[:title]).to include("can't be blank")
      end
    end
  end
end
