class Admin::BankPartnersController < ApplicationController
	before_action :admin_access
	#GET
	def index
		@bank_partners = BankPartner.all
	end

	def new
		@bank_partner = BankPartner.new
	end

	def edit
		
	end
    
    def show
    	
    end

    #POST

    def create
    	@bank_partner = BankPartner.create(bank_partner_params)
    	raise @bank_partner.inspect
    end

    def update
    	
    end

    def destroy
    	
    end

    private 
    def bank_partner_params
    	params.require(:bank_partner).permit(:name, :card_ids => [], :cards_attributes => [:name])
    end

end