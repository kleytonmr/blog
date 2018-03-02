Rails.application.routes.draw do
  resources :users

  #verbo  #rota			#Controller-action	
  get    'sign_in'   => 'sessions#new'
  post   'sign_in'   => 'sessions#create'
  delete 'sign_out'  => 'sessions#destroy'

end
