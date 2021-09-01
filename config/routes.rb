Rails.application.routes.draw do
  devise_for :users
  root to: 'shifts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, except: %i[destroy show]

  resources :shifts do
    resources :user_shifts
    resources :reclamations, only: %i[new create]
    get :search_employee, on: :collection
  end
  resources :user_shifts, only: [:update]
end
