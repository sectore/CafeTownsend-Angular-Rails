module ControllerMacros
  def login_as_user
    user = create(:user)
    session[:user_id] = user.id
  end
end