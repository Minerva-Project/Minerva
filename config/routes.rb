Minerva::Application.routes.draw do

  resources :users
  resources :courses


  delete '/users/:user_id/courses/:id', to: 'courses#remove_student', as: 'remove_student'
  match  '/users/:user_id/courses/:id', to: 'courses#add_student',    as: 'add_student'

  delete  '/users/:user_id/courses/:id', to: 'courses#remove_teacher', as: 'remove_teacher'
  match  '/users/:user_id/courses/:id', to: 'courses#add_teacher',     as: 'add_teacher'

  devise_for :users
  resources :users, :controller => "users" do
    resources :profiles
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
    get "logout", :to => "devise/sessions#destroy"
  end

  resources :notices

  match '/manage' => 'users#manage'
  match '/admin' => 'static_pages#admin'
  match '/teacher' => 'static_pages#teacher'
  match '/student' => 'static_pages#student'
  match '/course/:id', to: 'users#search_student', as: 'search_student'
  match '/course/:id', to: 'users#search_teacher', as: 'search_teacher'

end
