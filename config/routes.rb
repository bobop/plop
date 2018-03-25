Rails.application.routes.draw do
  root to: "home#index"
  get 'schools', to: 'schools#index'
  
  resources :schools do
    resources :rooms
    resources :grades
    resources :divisions
  end
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '*id', to: 'schools#show'
end
