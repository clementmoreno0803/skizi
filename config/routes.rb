Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
<<<<<<< HEAD
=======
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :shifts
>>>>>>> 93bf2f40284d06605e17ddbace0c922e74a06583
end
