class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :captured_images, dependent: :destroy

  accepts_nested_attributes_for :captured_images

  validates :title,
            :catch_copy,
            :concept,
            presence: true
end
