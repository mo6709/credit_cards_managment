class CardsController < ApplicationController
	#GET
	def index
		@cards = Card.all
		respond_to do |format|
		    format.html { @cards } 
		    format.json { render :json => @cards }   
		end  
	end
    
	def index_type
	    @cards = Card.type(params[:type])
	    render 'index' 
	end

	def show
		@card = Card.find_by(params[:id])
		respond_to do |format|
			format.html { @card }
			format.json { render :json => @card }
		end 	
	end

end
