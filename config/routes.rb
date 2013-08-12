Minerva::Application.routes.draw do

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

  match '/admin' => 'static_pages#admin'
  match '/teacher' => 'static_pages#teacher'
  match '/student' => 'static_pages#student'
  match '/student_home' => 'static_pages#admin'
  match '/course/:id', to: 'users#search', as: 'search'

end
