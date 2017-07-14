class BankPartnersController < ApplicationController
    #GET
	def index
		@bank_partners = BankPartner.all
	end
    
    def new
    end

    def show
    	@bank_partner = BankPartner.find_by(:id => params[:id])
    end

    def edit
    end

    #POST

    def create
    end

    def update
    end
end	