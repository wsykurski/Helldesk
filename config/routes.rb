Rails.application.routes.draw do
  resources :issues
#  get 'sessions/new'
#  get 'sessions/create'
#  get 'sessions/destroy'

  controller :sessions do
    get 'login' => :new#, :as => :login
    post 'login' => :create
    delete 'logout' => :destroy#, :as =>:logout
  end

  controller :notes do
    post 'add_note' => :create
    get 'add_note' => :new
  end

#  get 'sessions/create'
#  get 'sessions/destroy'

  resources :users
#  get 'static_content/start'
#
#  get 'static_content/about', :as => :about
#
#  get 'static_content/help', :as => :help
  controller :static_content do
    get 'start' => :start
    get 'help' => :help
    get 'about' => :about
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_content#start', :as => :welcome

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
