class Admin::CardsController < ApplicationController
    before_action :admin_access
    before_action :find_card, :only => [:edit, :update, :show, :destroy] 
	#GET
	def index
        @cards = Card.all
	end

	def new
		@card = Card.new
        render "admin/cards/new.html.erb", :layout => false 
        # respond_to do |format|
        #     format.html { @card }
        #     format.json { } 
        # end
	end

	def edit
	end
    
    def show
    end

    #POST
    def create
        @card = Card.create(card_params.reject{|a| a == 'c_type'})
        @card.c_type = card_params[:c_type].to_i
        if @card.save
            respond_to do|format| 
                format.html { redirect_to admin_card_path(@card.id), alert: 'Card successfully created' }
                format.json { render :json => @card, :status => 201 }
            end    
        else
            render :new
        end	
    end

    def update
        @card.update(card_params.reject{|a| a == 'c_type'})
        @card.c_type = card_params[:c_type].to_i
        if @card.save
            redirect_to admin_card_path(@card.id), alert: 'Card successfully edited'
        else
            render :edit
        end
    end

    def destroy 
        card = @card.delete
        redirect_to admin_cards_path, :alert => "Succssesfuly removed #{card.name}"	
    end

    private

    def find_card
    	@card = Card.find_by(:id => params[:id])
    end

    def card_params
        params.require(:card).permit(:name, 
                                    :credit_needed, 
                                    :c_type, 
                                    :bonus, 
                                    :apr, 
                                    :balance_transfer_apr, 
                                    :balance_transfer_period, 
                                    :anual_fee, 
                                    :corp_url, 
                                    :category_id,
                                    :bank_partner_ids => [], 
                                    :bank_partners_attributes => [:name]
                                    )
    end
end