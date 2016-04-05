class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :caputured_images, dependent: :destroy

  accepts_nested_attributes_for :captured_images

  validates :titie,
            :catch_copy,
            :concept,
            presence: true
end
