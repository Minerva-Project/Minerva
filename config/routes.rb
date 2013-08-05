Minerva::Application.routes.draw do

  resources :courses 
  resources :users 

  delete '/users/:user_id/courses/:id', to: 'courses#remove', as: 'remove'
  match  '/users/:user_id/courses/:id', to: 'courses#add',    as: 'add'

 # match '/users/:user_id/courses/:id(.:format)/delete', to:  'courses#remove', as: 'remove'

  devise_for :users
  resources :users, :controller => "users" do
    resources :profiles
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  match '/admin' => 'static_pages#admin'
  match '/course/:id', to: 'users#search', as: 'search'

end
