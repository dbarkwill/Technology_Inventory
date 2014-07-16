Rails.application.routes.draw do

  # Root View
  root 'static_pages#home'

  # Devise Configuration
  devise_for :users
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users/:id' => 'devise/registrations#update', :as => 'user_registration'
  end

  # Routes for People
  resources :people do
    get 'delete'
  end

  # Routing for administrator Dashboard
  namespace :admin do
    get '', to: 'dashboard#index', as: :dashboard
    resources :users do
      get 'delete'
    end
    resources :device_groups
  end

  # Routes for networks
  get 'networks/device_list' => 'networks#get_device_list', as: :get_device_list_network
  post 'networks/add_address' => 'networks#add_address', as: :add_address_network
  resources :networks

  # Routes for articles
  get 'kb/tags/:tag' => 'articles#index', as: :tag
  post 'kb/link' => 'articles#link'
  get 'kb/linkable_type' => 'articles#linkable_type_select', as: :linkable_select_article
  resources :articles, :path => "kb"

  # Routes for checkout histories
  get 'checkout/device_group' => 'checkout_histories#device_group_select', as: :device_type_loan
  get 'checkin/:id' => 'checkout_histories#checkin', as: :checkin
  resources :checkout_histories, :path => "checkout"

  # Routes for Logs
  resources :logs

  #Routes for attributes
  resources :attrs

  # Routes for Devices
  get 'devices/:id/device_info' => 'devices#device_info', as: :device_info
  get 'devices/:group' => 'devices#index', as: :device_types
  get 'devices/:group/new' => 'devices#new', as: :device_group_new
  get 'devices/:group/:id' => 'devices#show', as: :device_group_show
  get 'devices/:group/:id/edit' => 'devices#edit', as: :device_group_edit
  delete 'devices/:group/:id' => 'devices#destroy', as: :device_group_delete
  delete 'devices/:group/:id/clear_history' => 'devices#clear_history', as: :device_group_clear_history
  resources :devices

  # Routes for addresses
  resources :addresses

  

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
