class CapturedImage < ActiveRecord::Base
  enum status: %i(main sub)

  belongs_to :prototype

  validates :content,
            :status,
            presence: true

end
