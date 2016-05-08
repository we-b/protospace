require 'rails_helper'

describe CapturedImage do
  describe '#create' do
    context "with valid attributes" do
      it "has a valid factory" do
        captured_image = build(:captured_image, :main)
        expect(captured_image).to be_valid
      end
    end

    context "without valid attributes" do
      it "is missing a content" do
        captured_image = build(:captured_image, :main, content: nil)
        captured_image.valid?
        expect(captured_image.errors[:content]).to include("can't be blank")
      end

      it "is missing a status" do
        captured_image = build(:captured_image)
        captured_image.valid?
        expect(captured_image.errors[:status]).to include("can't be blank")
      end
    end
  end
end
