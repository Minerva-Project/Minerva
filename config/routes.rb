Minerva::Application.routes.draw do

  resources :logs
  resources :users
  resources :courses
  resources :notices
  resources :users

  resources :courses do
    resources :schedules
    resources :users
    resources :notices
  end

  delete '/users/:user_id/courses/:id', to: 'courses#remove', as: 'remove'
  match  '/users/:user_id/courses/:id', to: 'courses#add',    as: 'add'
  
  devise_for :users
  resources :users, :controller => "users" do
    resources :profiles
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
    delete "logout", :to => "devise/sessions#destroy"
  end

  match '/index' => 'manage#index'
  match '/teacher' => 'static_pages#teacher'
  match '/student' => 'static_pages#student'
  match '/admin' => 'static_pages#admin'
  match '/course/:id', to: 'users#search', as: 'search'

end
