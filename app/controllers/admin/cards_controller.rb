class Admin::CardsController < ApplicationController
    before_action :admin_access
    before_action :find_card, :only => [:edit, :update, :show] 
	#GET
	def index
        @cards = Card.all
	end

	def new
		@card = Card.new
	end

	def edit
	end
    
    def show

    end

    #POST

    def create
    	
    end

    def update
    	
    end

    def destroy
    	
    end

    def find_card
    	@card = Card.find_by(:id => params[:id])
    end
end