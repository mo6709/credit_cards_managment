class AccountsController < ApplicationController
	before_action :require_login

	#GET
	def index
		if params[:user_id] == current_user.id
			@user = User.find_by(:id => params[:user_id])
			if @user.nil?
				redirect_to login_path, :alert => "Login required"
			else
				@accounts = @user.accounts
			end
		end
	end

	def new
		if params[:user_id] && !User.exists?(params[:user_id])
			redirect_to login_path, :alert => "Login required"
		else
			@account = Account.new
		end
	end

	def show
		
	end

	def edit
		
	end

	#POST
	def create
		raise params.inspect
		
	end

	def update
		
	end

	def destroy
		
	end

	private 

	def accounts_params
		params.require(:accounts).premit(:account_number, :credit_line, :due_date, :open_date)
	end
end