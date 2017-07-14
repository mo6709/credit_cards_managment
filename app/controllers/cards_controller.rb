class CardsController < ApplicationController
	#GET
	def index_all
		@cards = Card.all
	end
    
	def index_type
		@cards = Card.type(params[:type]) 
	end

	def show
		@card = Card.find_by(params[:id]) 
	end

	def new
		
	end

	def edit
		
	end

	def create
		
	end

	def update
		
	end
end
