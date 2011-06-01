CityBoyzOutdoors::Application.routes.draw do

  get "social_messages/index"

  # TODO: Make these work!
  #scope :path => 'admin', :controller => :sessions do
  #  get '/login' => :new
  #  post '/login' => :create
  #end

  #scope :controller => :videos do
  #  post '/media/videos/new' => :create # TODO: Refactor so that you are not having to say /media/video.
  #end

  # Login/logout/auth routes.
  # TODO: Find a way to refactor these four routes.
  match 'admin/edit' => 'admins#edit', :as => :edit_current_admin

  match '/admins/signup' => 'admins#new', :as => :signup

  match '/admin/logout' => 'sessions#destroy', :as => :logout

  match '/admin/login' => 'sessions#new', :as => :login

  resources :sessions
  resources :admins
  resources :team_members, :execpt => :show

  # # Media items.
  # scope :path => :media do
  #   resources :videos
  # end
  resources :videos
  resources :social_messages

  # Root route.
  root :to => 'pages#home'

  # PagesController named routes.
  get '/about' => 'team_members#index'
  #get '/media' => 'pages#media'

  # TODO: Figure out a way to test these routes.
  scope :controller => :feedback do
    get '/contact' => :new
    post '/contact' => :create
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
