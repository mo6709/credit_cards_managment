class Admin::CardsController < ApplicationController
    before_action :admin_access 
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
end