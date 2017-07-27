module ApplicationHelper
  def logged_in?
  	!!session[:user_id]
  end
  
  def current_user
  	User.find_by(:id => session[:user_id])
  end

  def owner_access
    if current_user.try(:admin)
      return true
    elsif params[:user_id]
      unless current_user.id == params[:user_id].to_i
        redirect_to root_path, :alert => "You must be loggedin as the owner of this contents"
      end
    elsif params[:id]
      unless current_user.id == params[:id].to_i
        redirect_to root_path, :alert => "You must be loggedin as the owner of this contents"
      end
    end
  end

  def admin_access  
  	unless current_user.try(:admin)
  		redirect_to root_path, :alert => "You most be logged in as an admin to access this section"
  	end
  end

  def loggedin_buttons_for(account)
  	if logged_in?
      return [button_to("Edit", edit_user_account_path(current_user.id, account.id), method: :get, class: 'floated btn btn-secondary'),
              button_to("Delete", "/users/#{current_user.id}/accounts/#{account.id}", method: :delete, class: 'btn btn-secondary')].join.html_safe
  	end
  end

  def admin_buttons_for(element)
    if current_user.try(:admin)
      if element.instance_of?(Card)
         return [button_to("Edit", edit_admin_card_path(element.id), method: :get, class: 'floated btn btn-secondary'),
                 button_to("Delete", "/admin/cards/#{element.id}", method: :delete, class: 'btn btn-secondary')].join.html_safe
      elsif element.instance_of?(BankPartner)
          return [button_to("Edit", edit_admin_bank_partner_path(element.id), method: :get, class: 'floated btn btn-secondary'),
                  button_to("Delete", "/admin/bank_partners/#{element.id}", method: :delete, class: 'btn btn-secondary')].join.html_safe
      end
    end    
  end

  def add_card(card)
    if logged_in? && !current_user.admin
      if !current_user.cards.include?(card)
        button_to("Get this card", new_user_account_with_card_path(current_user.id, card.id), method: :get, class: 'btn btn-secondary')
      end
    end
  end

end