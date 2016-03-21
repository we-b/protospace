class Prototype < ActiveRecord::Base
  has_many :captured_images, dependent: :destory

  validates: :title,
             :catch_copy,
             :concept,
             presece: true
end
