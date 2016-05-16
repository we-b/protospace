require 'rails_helper'

describe Prototype do
  describe 'associations' do
    it 'is associated with a user' do
      user = create(:user)
      prototype = create(:prototype, user: user)
      expect(prototype.user).to eq user
    end

    describe 'with captured_images' do

    end

    describe 'with comments' do
      let(:comments_count) { 5 }
      let!(:prototype) { create(:prototype, :with_comments, comments_count: comments_count) }

      it 'is associated with comments' do
        expect(prototype.comments.size).to eq comments_count
      end

      it 'deletes the comments when prototype is deleted' do
        expect{ prototype.destroy }.to change(Comment, :count).by(-1*comments_count)
      end
    end

    describe 'with likes' do

    end
  end

  describe 'validations' do
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
    it "returns dates in a specified format" do
      prototype = build(:prototype, created_at: "2016-05-07")
      expect(prototype.posted_date).to eq "May 07 Sat"
    end
  end

  describe "#liked_by?(user)" do
    context "when liked by a user" do
      it "returns true" do
        user = create(:user)
        prototype = create(:prototype, user: user)
        like = create(:like, prototype: prototype, user: user)
        expect(prototype.liked_by?(user)).to be_truthy
      end
    end

    context "when not liked by a user" do
      it "returns nil" do
        user = create(:user)
        another_user = create(:user, id: user.id + 1)
        prototype = create(:prototype, user: another_user)
        like = create(:like, prototype: prototype, user: another_user)
        expect(prototype.liked_by?(user)).to be_falsey
      end
    end
  end

  describe "#set_sub_thumbnails" do
    it "returns an array containing sub_images" do
      prototype = create(:prototype, :with_sub_images)
      expect(prototype.set_sub_thumbnails).to eq prototype.captured_images
    end
  end

  describe "#reject_sub_images(attributed)" do
    it "doesn't save a record with nil content" do
      captured_sub_image = build(:captured_image, :sub, content: nil)
      captured_sub_image.valid?
      expect(captured_sub_image.errors[:content]).to include("can't be blank")
    end
  end
end
