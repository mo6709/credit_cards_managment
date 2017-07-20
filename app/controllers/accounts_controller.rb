class AccountsController < ApplicationController
	before_action :require_login

	#GET
	def index
		if params[:user_id].to_i == current_user.id
			@user = User.find_by(:id => params[:user_id])
			@accounts = @user.accounts
		else
			@user = User.find_by(:id => current_user.id)
			@accounts = @user.accounts
		end
	end

	def new
		if params[:user_id] == current_user.id
			@account = Account.new(:user_id => current_user.id)
		else
			redirect_to root_path, :alert => "Access for account onwes only" 
		end
	end

	def show
		user = User.find_by(:id => params[:user_id])
		if (user == current_user) && (user.account_ids.include?(params[:id].to_i))
			@account = Account.find_by(:id => params[:id])
		else
			redirect_to root_path, :alert => "Can't show this account. Make sure you are to owner and loggedin as the owner"
		end
	end

	def edit
		user = User.find_by(:id => params[:user_id])
		if (user == current_user)  && (user.account_ids.include?(params[:id].to_i))
			@account = Account.find_by(:id => params[:id])
		else
			redirect_to root_path, :alert => "Can't show this account. Make sure you are to owner and loggedin as the owner"
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

	def destroy
		user = User.find_by(:id => params[:user_id])
		if (user == current_user)  && (user.account_ids.include?(params[:id].to_i))
			Account.delete(params[:id])
			redirect_to user_accounts_path(user.id), :alert => "successfuly deleted"
		else
			redirect_to root_path, :alert => "Can't show this account. Make sure you are to owner and loggedin as the owner"
		end
	end

	private 

	def account_params
		params.require(:account).permit(:user_id, :card_id, :account_number, :credit_line, :due_date, :open_date)
	end
end