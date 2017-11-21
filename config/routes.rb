Rails.application.routes.draw do
 

  
  devise_for :customers
#   devise_scope :customers do
#   get "signup",   :to => "accounts#new"
#   get "signin",   :to => "devise/sessions#new"
#   get "signout",  :to => "devise/sessions#destroy"
#   get "cancel_user_registration", :to => "devise/registrations#cancel"
#   post "user_registration",       :to => "customers#create"
#   # get "new_user_registration",    :to => "customers#new"
#   # get "edit_user_registration",   :to => "customers#edit"
# end
  resources :measurements
  resources :addresses
  resources :customers
  resources :customer_groups
  resources :styles
  devise_for :users
  
  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  get 'carts/show'
  post 'carts/empty'

  get 'customer_flow/homepage'

  get 'customer_flow/catalog'
  get 'customer_flow/product_details'
  get 'customer_flow/cart_checkout_measurements'
  post 'customer_flow/cart_checkout_measurements'
  resources :products
  resources :categories
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :customer_flow

  resources :payments, only: [:index, :new,:create]
  #get 'payments/index'

  #get 'payments/new'

  #get 'payments/create'

  # You can have the root of your site routed with "root"
  root 'customer_flow#homepage'

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
