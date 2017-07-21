class AccountsController < ApplicationController
	before_action :require_login, :owner_access
    before_action :include_account?, :only => [:show, :edit, :destroy]

	#GET
	def index
		@user = current_user
		@accounts = @user.accounts
	end

	def new
		if params[:card_id]
			@account = Account.new(:user_id => current_user.id, :card_id => params[:card_id])
		else
			@account = Account.new(:user_id => current_user.id)
		end
	end

	def show
		@account = Account.find_by(:id => params[:id])
	end

	def edit
		@account = Account.find_by(:id => params[:id])
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
		Account.delete(params[:id])
		redirect_to user_accounts_path(current_user.id), :alert => "successfuly deleted"
	end

	def include_account?
		unless current_user.account_ids.include?(params[:id].to_i)
            redirect_to user_accounts_path(current_user.id), :alert => "You do not have access to this content"
		end
	end

	private 
	def account_params
		params.require(:account).permit(:user_id, :card_id, :account_number, :credit_line, :due_date, :open_date)
	end
end