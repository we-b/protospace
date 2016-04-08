module UsersHelper
  def set_profile_photo(user)
    user.avatar.presence || asset_path('noimage.png')
  end
end
