class User < ActiveRecord::Base
  include ActionView::Helpers

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, UserImageUploader

  has_many :prototypes

  validates :name, presence: true

  def set_profile_photo
    avatar.presence || asset_path('assets/noimage.png')
  end
end
