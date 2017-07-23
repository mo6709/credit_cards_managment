Rails.application.routes.draw do
  #welcome
  root to: 'welcome#home'
  
  #sessions
  get '/login' => 'sessions#new'
  post '/sessions/create' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  #card
  resources :cards, :only => [:index, :show, :new, :edit, :create, :update]
  get '/cards/index_type/:type' => 'cards#index_type', :as => 'cards_index_type'



  #user
  get '/auth/google/callback' => 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  
  resources :users, :only => [:new, :show, :edit, :create, :update]

  resources :users do
    resources :accounts
  end
   
  #admin
 namespace 'admin' do
    resources :accounts 
    resources :cards
    resources :bank_partners
  end

  #account 
  resources :accounts
  get '/users/:user_id/cards/:card_id/accounts/new' => 'accounts#new', :as =>'new_user_account_with_card'

  resources :categories
  resources :card_bank_partners
  resources :bank_partners
  
  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
