Rails.application.routes.draw do
  
  resources :honorifics
  resources :states
  resources :election_nominations
  resources :elections do
    resources :election_posts
    resources :election_nominations
  end
  
  resources :posts

  resources :election_types

  get 'nominations/update_posts' , as: :update_posts
  get 'nominations/update_states' , as: :update_states

  get 'nomination_attachments' => 'nomination_attachments#index'
  post 'nomination_attachments' => 'nomination_attachments#index'
  post  'nomination_attachments/attach' => 'nomination_attachments#attach'
  get 'nomination_attachments/:id' => 'nomination_attachments#show', as: :nomination_attachment
  get 'admin/home' => 'admin#home'
  resources :nominations do
    resources :candidate
    resources :proposer
    resources :seconders
  end

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
  root 'nominations#new'
  resources :designations 
  resources :members
  
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
