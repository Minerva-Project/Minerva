Minerva::Application.routes.draw do

  resources :users
  resources :courses

  resources :courses do
    resources :schedules
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

  resources :notices

  match '/show_teacher_courses' => 'teachers#show_courses'
  match '/classes/courses/:id' => 'teachers#manage_class', as: 'manage_class'


  match '/show_student_courses' => 'students#show_courses'
  match '/admin' => 'static_pages#admin'
  match '/teacher' => 'static_pages#teacher'
  match '/student' => 'static_pages#student'
  match '/course/:id', to: 'users#search', as: 'search'

  match '/classes/courses/:id' => 'classes#index',   as: 'class'
  #match '/courses/:course_id/schedules/:id'       => 'schedules#index', as: 'manage_schedules'
  #match '/courses/:course_id/schedules/:id'       => 'schedules#index', as: 'schedules'


end
