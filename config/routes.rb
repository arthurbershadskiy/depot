Depot::Application.routes.draw do
  get "store/index"
  resources :products

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'store#index', as: 'store'

end
