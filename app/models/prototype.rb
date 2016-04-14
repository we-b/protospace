class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :captured_images, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

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
