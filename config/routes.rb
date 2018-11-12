Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments
  end
  
  get 'posts/index'
  root 'posts#index'

  get 'posts/show'
  root 'posts#show'

  get 'posts/new'
  root 'posts#new'
end
