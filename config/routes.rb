Minerva::Application.routes.draw do
  
  root :to=>"static_pages#admin"
  
  resources :users
  resources :courses
  
  devise_for :user
  devise_scope :user do
    get "sign_in", :to => "devise/sessions#new"
    get "sign_out", :to => "devise/sessions#destroy"
  end

end
