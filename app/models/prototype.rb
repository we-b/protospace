class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :captured_images, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one :main_image, class_name: "CapturedImage"

  accepts_nested_attributes_for :captured_images, reject_if: :reject_sub_images, limit: 4

  acts_as_taggable

  validates :title,
            :catch_copy,
            :concept,
            presence: true

  #kaminari
  paginates_per 8

  def reject_sub_images(attributed)
    attributed['content'].blank?
  end

  MAXMUN_IMAGE_NUM = 3
  def set_sub_thumbnails
    sub_images = captured_images.sub
    MAXMUN_IMAGE_NUM.times { |i| sub_images[i] ||= captured_images.build(status: "sub") }
    sub_images
  end

  def posted_date
    created_at.strftime('%b %d %a')
  end

  def liked_by?(user)
    likes.find_by(user_id: user)
  end
end
