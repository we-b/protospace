require 'rails_helper'

describe CapturedImage do
  describe '#create' do
    context "without valid attributes" do
      it "is invalid without a content" do
        captured_image = build(:captured_image, :main, content: nil)
        captured_image.valid?
        expect(captured_image.errors[:content]).to include("can't be blank")
      end
    end
  end
end
