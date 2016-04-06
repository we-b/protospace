module UsersHelper
  def set_profile_photo(user)
    user.avatar.present? ? user.avatar : asset_path('noimage.png')
  end
end
