class BankPartnersController < ApplicationController
    #GET
	def index
		@bank_partners = BankPartner.all
	end

    def show
    	@bank_partner = BankPartner.find_by(:id => params[:id])
        respond_to do |format|
            format.html { @bank_partner }
            format.json { render :json => @bank_partner }
        end
    end

end	