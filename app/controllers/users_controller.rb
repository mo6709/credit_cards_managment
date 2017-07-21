class UsersController < ApplicationController
	before_action :require_login, :except => [:new, :create]
    before_action :owner_access 
	#GET 
	def new
		@user = User.new
	end

	def show
		@user = User.find_by(id: params[:id])
	end
    
    def edit
    	@user = User.find_by(id: params[:id])
    end

    #POST
	def create
		@user = User.create(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_path, :alert => "successfuly created user"
		else
			render :new
		end
	end

	def update
		@user = User.find_by(id: params[:id])
		@user.update(user_params)
		if @user.save
			redirect_to root_path
		else
			render :edit
		end
	end
    
	private 
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

	def method_name
		
	end
end
