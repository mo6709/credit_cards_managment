class Admin::BankPartnersController < ApplicationController
	before_action :admin_access
	#GET
	def index
		@bank_partners = BankPartner.all
	end

	def new
		@bank_partner = BankPartner.new
		@card = Card.new
	end

	def edit
		
	end
    
    def show
    	@bank_partner = BankPartner.find_by(:id => params[:id])
    end

    #POST

    def create
    	@bank_partner = BankPartner.create(bank_partner_params)
    	if @bank_partner.valid?
    	    redirect_to admin_bank_partner_path(@bank_partner.id), alert: 'Bank Partner was successfully created'
    	else
    		render 'new'
    	end
    end

    def update
    	
    end

    def destroy
    	
    end

    private 
    def bank_partner_params
    	params.require(:bank_partner).permit(:name, :card_ids => [], 
    		                                 :cards_attributes => 
    		                                 [:name, :c_type, :bonus, :apr, :anual_fee, :credit_needed, :balance_transfer_apr, :balance_transfer_period, :category_id, :corp_url]
    		                                 )
    end

end