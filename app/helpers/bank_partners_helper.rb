module BankPartnersHelper

	def admin_create_bank_partner
		if current_user.try(:admin) 
			link_to("Create New Bank Partner", new_admin_bank_partner_path)
		end
	end
end
