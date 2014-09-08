Rails.application.routes.draw do

  root :to => 'questions#index'

  resources :users
  resources :sessions

  resources :questions do
    resources :answers
  end

end
