require 'rails_helper'

describe CapturedImage do
  describe '#create' do
    context "with valid attributes" do
      it "has a valid factory" do
        captured_image = build(:captured_image, :main)
        expect(captured_image).to be_valid
      end
    end

    context "without content attribute" do
      it "returns error" do
        captured_image = build(:captured_image, :main, content: nil)
        captured_image.valid?
        expect(captured_image.errors[:content]).to include("can't be blank")
      end
    end

    context "without status attribute" do
      it "returns error" do
        captured_image = build(:captured_image, status: nil)
        captured_image.valid?
        expect(captured_image.errors[:status]).to include("can't be blank")
      end
    end

    it "has the wrong content format" do
      image = build(:captured_image, :main, content: fixture_file_upload("img/sample.tiff", 'image/tiff'))
      image.valid?
      expect(image.errors[:content][0]).to include("You are not allowed to upload")
    end
  end

  describe 'association' do
    it 'is associated with a prototype' do
      prototype = create(:prototype)
      captured_image = create(:captured_image, :main, prototype: prototype)
      expect(captured_image.prototype).to eq prototype
    end
  end
end
