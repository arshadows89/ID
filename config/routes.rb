Rails.application.routes.draw do
  get 'password_resets/new'

  get 'sessions/new'

  get 'home/index'
  root 'home#index'

  get "/forums/:forum_id(/page/:page)", to: 'forums#show_page', as: 'forum_show_page'

  get 'admin/streams'
  get 'admin/news'
  get 'admin/videos'
  get 'admin/home'
  get 'admin/recruitment'
  get 'admin/adminupdate'
  get '/admin', to: 'admin#index', as: 'admin_index'
  get '/recruitments/edit_multiple(.:format)', to: 'recruitments#edit_multiple', as: 'edit_multiple_recruitments'
  put '/recruitments/update_multiple(.:format)', to: 'recruitments#update_multiple', as: 'update_multiple_recruitments'
  get '/users/edit_multiple(.:format)', to: 'users#edit_multiple', as: 'edit_multiple_users'
  put '/users/update_multiple(.:format)', to: 'users#update_multiple', as: 'update_multiple_users'



  # resources :recruitments do
  #   collection do
  #     get :edit_multiple
  #     put :update_multiple
  #   end
  # end
  
get "logout" => "sessions#destroy", :as => "logout"
get "login" => "sessions#new", :as => "login"
get "signup" => "users#new", :as => "signup"
  resources :forums, only: [:index, :show] do
    resources :posts, only: [:edit, :update, :new, :create, :destroy, :show] do
        resources :comments, only: [:edit, :update, :new, :create, :destroy]
    end
  end
  # get '/forums/:forum_id(.:format)/posts/:id(.:format)', to: 'posts#show', as: 'forum_post'
  # resources :comments, only: [:edit, :update, :new, :create, :destroy]

  resources :homepagenews, only: [:edit, :update, :new, :create, :destroy]
  resources :playlists, only: [:edit, :update]
  resources :users
  resources :sessions
  resources :password_resets
  resources :streams
  resources :videos
  resources :homepage, only: [:show]

  get 'home/closefb'

  # get '/signin', to: 'sessions#new'
  # post '/signin', to: 'sessions#create'
  # get '/logout', to: 'sessions#destroy'

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
