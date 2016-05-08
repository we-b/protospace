require 'rails_helper'

describe Prototype do
  describe '#create' do
    context "with valid attributes" do
      it "has a valid factory" do
        expect(build(:prototype)).to be_valid
      end
    end

    context "without valid attributes" do
      it "is missing a title" do
        prototype = build(:prototype, title: nil)
        prototype.valid?
        expect(prototype.errors[:title]).to include("can't be blank")
      end

      it "is missing a catch_copy" do
        prototype = build(:prototype, catch_copy: nil)
        prototype.valid?
        expect(prototype.errors[:catch_copy]).to include("can't be blank")
      end

      it "is missing a concept" do
        prototype = build(:prototype, concept: nil)
        prototype.valid?
        expect(prototype.errors[:concept]).to include("can't be blank")
      end
    end
  end

  describe "#posted_date" do
    context "with a matching date" do
      it "returns a matching posted_date" do
        prototype = build(:prototype)
        expect(prototype.posted_date).to eq prototype.created_at.strftime('%b %d %a')
      end
    end

    context "without a matching date" do
      it "doesn't returns a matching posted_date" do
        prototype = build(:prototype)
        expect(prototype.posted_date).not_to eq prototype.created_at
      end
    end
  end

  describe "#liked_by?(user)" do
    context "with a liking user" do
      it "returns a liking record" do
        user = create(:user_with_id)
        prototype = create(:prototype_with_id_and_user_id)
        like = create(:like_with_prototype_id_and_user_id)
        expect(prototype.liked_by?(user)).to eq prototype.likes.find_by(user_id: user)
      end
    end

  end
end
