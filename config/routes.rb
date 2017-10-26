Rails.application.routes.draw do
  root to: "dashboard#index"
  get 'users/new_intern', to: 'users/new_interns#new', as: 'new_intern'
  get 'users/new_staff', to: 'users/new_staffs#new', as: 'new_staff'
  get 'companies/associate_intern', to: 'companies#associate_intern', as: 'associate_intern'
  get 'attendances/start_work', to: 'attendances#start_work', as: 'start_work'
  get 'attendances/stop_work', to: 'attendances#stop_work', as: 'stop_work'
  get 'attendances/start_break', to: 'attendances#start_break', as: 'start_break'
  get 'attendances/stop_break', to: 'attendances#stop_break', as: 'stop_break'
  resources :companies
  resources :todos
  resources :notices
  resources :attendances
  resources :goals
  resources :reports
  resources :schedules
  resources :tasks
  devise_for :users, controllers: {}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
end
