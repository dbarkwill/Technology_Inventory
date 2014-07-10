Rails.application.routes.draw do

  devise_for :users

  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'registration'
  end

  resources :people

  namespace :admin do
    get '', to: 'dashboard#index', as: :dashboard
    resources :users
    resources :device_groups
  end

  get 'networks/device_list' => 'networks#get_device_list', as: :get_device_list_network
  post 'networks/add_address' => 'networks#add_address', as: :add_address_network


  get 'kb/tags/:tag' => 'articles#index', as: :tag

  post 'kb/link' => 'articles#link'

  get 'kb/linkable_type' => 'articles#linkable_type_select', as: :linkable_select_article

  get 'checkout/device_group' => 'checkout_histories#device_group_select', as: :device_type_loan

  resources :articles, :path => "kb"

  resources :checkout_histories, :path => "checkout"

  get 'checkin/:id' => 'checkout_histories#checkin', as: :checkin

  resources :logs

  resources :attrs

  get 'devices/:group' => 'devices#index', as: :device_types
  get 'devices/:group/new' => 'devices#new', as: :device_group_new
  get 'devices/:group/:id' => 'devices#show', as: :device_group_show
  get 'devices/:group/:id/edit' => 'devices#edit', as: :device_group_edit

  delete 'devices/:group/:id' => 'devices#destroy', as: :device_group_delete
  delete 'devices/:group/:id/clear_history' => 'devices#clear_history', as: :device_group_clear_history

  resources :devices

  root 'static_pages#home'

  resources :addresses

  resources :networks

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
