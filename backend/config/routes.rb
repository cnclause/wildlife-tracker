Rails.application.routes.draw do
      resources :animals
      resources :users, param: :_username
 
      
      post '/login', to: 'authentication#create'
      get '/profile', to: 'users#profile'


      delete 'removeAnimal/:animal_id', to: 'users#remove_animal'
      post 'addAnimal', to: 'users#add_animal'
      # post '/auth/login', to: "authentication#login"
      get '/*a', to: 'application#not_found'

end

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
