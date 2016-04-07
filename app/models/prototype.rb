class Prototype < ActiveRecord::Base

  belongs_to :user
  has_many :captured_images, dependent: :destroy

  accepts_nested_attributes_for :captured_images, reject_if: :reject_sub_images, limit: 4

  validates :title,
            :catch_copy,
            :concept,
            presence: true

  def reject_sub_images(attributed)
    attributed['content'].blank?
  end

  def set_main_thumbnail
    captured_images.main.first.content
  end

  def set_sub_thumbnails
    sub_images = captured_images.sub
    (count_rest_sub_images).times { sub_images << @prototype.captured_images.build(status: "sub") }
    sub_images
  end

  MAXMUN_IMAGE_NUM = 3
  def count_rest_sub_images
    MAXMUN_IMAGE_NUM - captured_images.sub.count
  end
end
