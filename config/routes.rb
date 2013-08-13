Minerva::Application.routes.draw do

  resources :notices
  resources :courses
  #resources :users

  delete '/users/:user_id/courses/:id', to: 'courses#remove', as: 'remove'
  match  '/users/:user_id/courses/:id', to: 'courses#add',    as: 'add'

  devise_for :users
  resources :users, :controller => "users" do
    resources :profiles
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
    get "logout", :to => "devise/sessions#destroy"
  end

  match '/manage' => 'users#manage'
  match '/admin' => 'static_pages#admin'
  match '/teacher' => 'static_pages#teacher'
  match '/student' => 'static_pages#student'
  match '/course/:id', to: 'users#search', as: 'search'
  match '/course/:id', to: 'users#search', as: 'add_teacher'

end
