Rails.application.routes.draw do

  root 'home#index'

  devise_for :users

  devise_for :employers, :skip => [:registrations]
  as :employers do
    get 'employers/edit' => 'devise/registrations#edit', :as => 'edit_employer_registration'
    put 'employers' => 'devise/registrations#update', :as => 'employer_registration'
  end

  devise_for :admins, :skip => [:registrations]

  resources :jobs

  resources :users, :except => :index
  resources :employers
  resources :admins



=begin
  scope '/employers' do

  end
=end
  #get 'admins' => 'admins#show', :as => 'admin_root'
  #Routes for Admin Interactions
=begin
  get 'admin_menus' => 'admin_menus#index', :as => 'admin_root'
  scope '/admin_menus' do

    as :admin do
      get 'site_admin/edit' => 'devise/registrations#edit', :as => 'edit_admin_registration'
      put 'site_admin' => 'devise/registrations#update', :as => 'admin_registration'
    end

  end
=end

  #, :path_prefix => 'manage'
  #get 'admins' => 'admins#show', :as => 'admin_root'
  #devise_for :admins  get 'admins' => 'admins#show', :as => 'admin_root'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'users#index'

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
