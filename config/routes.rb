Minerva::Application.routes.draw do

  root :to=>"static_pages#admin"
  
  resources :users do
    collection do
      get :students_association
    end
  end
  
  resources :courses do
    collection do
      post :include_student
      post :remove_student
    end
  end
  
  resources :logs
  
  devise_for :user
  devise_scope :user do
    get "sign_in", :to => "devise/sessions#new"
    get "sign_out", :to => "devise/sessions#destroy"
  end

end