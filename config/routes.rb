Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root 'index#index'

   #login
   get '/login' , to: 'login#index'
   post '/login' , to: 'login#login'
   get '/logout', to: 'login#logout'

   # user list
   resources :user  
   #profile
   get '/profile' , to: 'profile#index'
   patch '/profile/update' , to: 'profile#update'
end
