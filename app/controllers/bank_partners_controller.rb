class BankPartnersController < ApplicationController
    #GET
	def index
		@bank_partners = BankPartner.all
	end
    
    def new
    end

    def show
    end

    def edit
    end

    #POST

    def create
    end

    def update
    end
end


 # bank_partners#index
 #                       POST   /bank_partners(.:format)               bank_partners#create
 #      new_bank_partner GET    /bank_partners/new(.:format)           bank_partners#new
 #     edit_bank_partner GET    /bank_partners/:id/edit(.:format)      bank_partners#edit
 #          bank_partner GET    /bank_partners/:id(.:format)           bank_partners#show
 #                       PATCH  /bank_partners/:id(.:format)           bank_partners#update
 #                       PUT    /bank_partners/:id(.:format)           bank_partners#update
 #                       DELETE /bank_partners/:id(.:format)           bank_partners#destroy