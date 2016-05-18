Rails.application.routes.draw do

 
# FACEBOOK
  get 'auth/failure'

  get 'auth/callback'

  get 'auth/:provider/callback' => 'auth#callback'

# RATINGS
  # put 'solutions/:id/like' => 'rating#create'
  
  # put 'solutions/:id/dislike' => 'rating#create'

# COMMENTS
  post 'comments/create' => 'comments#create'

  delete 'comments/destroy' => 'comments#destroy'

# SOLUTIONS

  get 'solutions/index' => 'solutions#index'

  get 'solutions/new' => 'solutions#new'

  delete 'solutions/:id' => 'solutions#destroy'

  post 'solutions/create' => 'solutions#create'

  get 'solutions/:id' => 'solutions#show'

  get 'mysolutions' => 'solutions#mysolutions'

  put 'solutions/:id' => 'solutions#update'

  # QUESTIONS

  get 'questions/easy' => 'questions#easy'

  get 'questions/medium' => 'questions#medium'

  get 'questions/hard' => 'questions#hard'


  # get 'questions/show' => 'questions#show'
  
  get 'questions/:id' => 'questions#show'

  
#SIGN-UP

  get 'signup' => 'users#new', as: :users

  post 'signup' => 'users#create'

# LOGIN

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

# LOGOUT  

  get 'logout' => 'sessions#destroy'

# RATINGS

  resources :solutions do
    member do
      put "like", to: "solutions#upvote"
      put "dislike", to: "solutions#downvote"
    end
  end


#START CHALLENGE

  get 'main' => 'main#index'

  root 'users#new'

  #ABOUT PAGE

  get 'about' => 'main#about'

  resources :tags

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
