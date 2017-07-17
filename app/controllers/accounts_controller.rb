class AccountsController < ApplicationController
	before_action :require_login

	#GET
	def index
		if params[:user_id].to_i == current_user.id
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
		elsif params[:user_id] == current_user.id
			@account = Account.new(:user_id => current_user.id)
		else
			redirect_to login_path, :alert => "Login required" 
		end
	end

	def show
		user = User.find_by(:id => params[:user_id])
		if (user == current_user) && (user.account_ids.include?(params[:id].to_i))
			@account = Account.find_by(:id => params[:id])
		else
			redirect_to root_path, :alert => "Can't show this account. Make sure you are to owner and logged in"
		end
	end

	def edit
		user = User.find_by(:id => params[:user_id])
		if (user == current_user)  && (user.account_ids.include?(params[:id].to_i))
			@account = Account.find_by(:id => params[:id])
		else
			redirect_to root_path, :alert => "Can't show this account. Make sure you are to owner and logged in"
		end
	end

	#POST
	def create 
        @account = Account.create(account_params)
        if @account.save
        	redirect_to user_account_path(@account.user_id, @account.id), :alert => "Your account was created successfuly."
        else
        	render :new
        end
	end

	def update
		@account = Account.find_by(:id => params[:id])
		@account.update(account_params)
		if @account.save
			redirect_to user_account_path(@account.user_id, @account.id), :alert => "Your account was edited successfuly."
		else
			render :edit
		end
	end

	private 

	def account_params
		params.require(:account).permit(:user_id, :card_id, :account_number, :credit_line, :due_date, :open_date)
	end
end