class AccountsController < ApplicationController
	#GET
	def index
		if params[:user_id]
			@user = User.find_by(:id => params[:user_id])
			if @user.nil?
				redirect_to login_path
			else
				@accounts = @user.accounts
			end
		else
		end
	end

	def new
		@account = Account.new
	end

	def show
		
	end

	def edit
		
	end

	#POST
	def create
		
	end

	def update
		
	end

	def destroy
		
	end
end

         user_accounts GET    /users/:user_id/accounts(.:format)          accounts#index
                       POST   /users/:user_id/accounts(.:format)          accounts#create
      new_user_account GET    /users/:user_id/accounts/new(.:format)      accounts#new
     edit_user_account GET    /users/:user_id/accounts/:id/edit(.:format) accounts#edit
          user_account GET    /users/:user_id/accounts/:id(.:format)      accounts#show
                       PATCH  /users/:user_id/accounts/:id(.:format)      accounts#update
                       PUT    /users/:user_id/accounts/:id(.:format)      accounts#update
                       DELETE /users/:user_id/accounts/:id(.:format)      accounts#destroy