Rails.application.routes.draw do
  resources :schools, path: '' do
    resources :rooms
    resources :grades
    resources :divisions
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get '*id', to: 'schools#show'
end
