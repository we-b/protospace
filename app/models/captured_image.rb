class CapturedImage < ActiveRecord::Base
  belongs_to :prototype

  mount_uploader :content, PrototypeImageUploader

  enum status: %i(main sub)

  validates :content,
            :status,
            presence: true
end
