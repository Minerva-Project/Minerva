Minerva::Application.routes.draw do

  resources :courses do
    resources :users

  end
    match '/users/:user_id/courses/:id', to: 'users#add', as: 'add'
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
