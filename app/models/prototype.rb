class Prototype < ActiveRecord::Base
  has_many :captured_images, dependent: :delete_all

  validates: :title,
             :catch_copy,
             :concept,
             presece: true
end
