Rails.application.routes.draw do
  root 'users#index'

  get    'post'  => 'users#post'
  get    'index'  => 'users#index' 
  get	 'signup' => 'users#new'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users
end
