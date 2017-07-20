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

  def loggedin_buttons_for(account)
  	if logged_in?
      return [button_to("Edit", edit_user_account_path(current_user.id, account.id), method: :get),button_to("Delete", "/users/#{current_user.id}/accounts/#{account.id}", method: :delete)].join.html_safe
  	end
  end

end