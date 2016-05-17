module ControllerMacros
  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in create(:user)
  end
end
