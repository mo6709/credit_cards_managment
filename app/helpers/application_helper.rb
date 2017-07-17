module ApplicationHelper
  def logged_in?
  	!!session[:user_id]
  end
  
  def current_user
  	User.find_by(:id => session[:user_id])
  end

  def admin_access
    current_user.admin
  end
end
