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

      it "is invalid without a catch_copy" do
        prototype = build(:prototype, catch_copy: nil)
        prototype.valid?
        expect(prototype.errors[:catch_copy]).to include("can't be blank")
      end

      it "is invalid without a concept" do
        prototype = build(:prototype, concept: nil)
        prototype.valid?
        expect(prototype.errors[:concept]).to include("can't be blank")
      end
    end
  end

  describe "#posted_date" do
    context "with matching dates" do
      it "returns a matching posted_date" do
        prototype = build(:prototype)
        expect(prototype.posted_date).to eq "#{prototype.created_at.strftime('%b %d %a')}"
      end
    end
  end
end
