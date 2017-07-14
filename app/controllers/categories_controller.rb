class CategoriesController < ApplicationController
    #GET
	def index
		@categories = Category.all
	end

	def new
	end

	def show
		@category = Category.find_by(:id => params[:id])
	end
    
    def edit
    end

    #POST
	def creat
	end

	def update
	end
end
