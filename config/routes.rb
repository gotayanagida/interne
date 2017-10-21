Rails.application.routes.draw do
  resources :attendances
  resources :goals
  resources :reports
  resources :schedules
  resources :tasks
  resources :users
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "dashboard#index"
end
