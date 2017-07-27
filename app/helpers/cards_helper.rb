module CardsHelper
	def links_for_bank_partners(card)
      links = card.bank_partners.map do |bank| 
      	        link_to(bank.name, bank_partner_path(bank.id)) 
              end
      links.join(" | ").html_safe        
	end

	def admin_create_card
		if current_user.try(:admin) 
			link_to("Create New Card", new_admin_card_path)
		end
	end
end	
