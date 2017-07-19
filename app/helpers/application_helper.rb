module ApplicationHelper
  def logged_in?
  	!!session[:user_id]
  end
  
  def current_user
  	User.find_by(:id => session[:user_id])
  end

  def admin_access  
      unless current_user.try(:admin)
  		flash[:alert] = "You most be logged in as an admin to access this section"
  		redirect_to root_path
  	  end
  end

end
