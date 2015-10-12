module ApplicationHelper

  def user_home_path
    user_path(current_user)
  end

end
