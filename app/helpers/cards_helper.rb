module CardsHelper
	def links_for_bank_partners(card)
      links = card.bank_partners.map do |bank| 
      	        link_to(bank.name, bank_partner_path(bank.id)) 
              end
      links.join(" | ").html_safe        
	end
end	
