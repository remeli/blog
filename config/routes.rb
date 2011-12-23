Blog::Application.routes.draw do
  
  # matches:
  match "sign_up" => "users#new", :as => "sign_up"
  match "log_in" => "sessions#new", :as => "log_in"
  match "log_out" => "sessions#destroy", :as => "log_out"
  
  # resources:
  resources :sessions
  resources :users, :only => [:index, :show, :new, :create] do
    get 'settings', :on => :member
  end
  resources :posts do
    resources :comments
    get "page/:page.:format", :action => :index, :on => :collection, :defaults => { :format => "html"}
  end
  
  resources :categories, :only => :show
  resources :pages, :only => [:index, :show]
  
  # match '/:permalink', :to => "pages#show"
  match 'static/:permalink', :to => "pages#show"
  
  # admin:
  match "admin" => "admin#index", :as => "admin"
  namespace :admin do
    resources :posts, :except => [:new, :create]
    resources :users, :except => [:new, :create]
    resources :categories, :except => [:show]
    resources :pages, :except => [:show]
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'static#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'

end