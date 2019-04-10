Rails.application.routes.draw do
  #get 'tickets/create'
  #get 'tickets/destroy'
  #get 'tickets/update'
  
  #get 'event_venues/create'
  #get 'event_venues/destroy'
  #get 'event_venues/update'
  
  #get 'events/create'
  #get 'events/destroy'
  #get 'events/update'

  #get 'users/create'
  #get 'users/destroy'
  #get 'users/update'
  post '/tickets' => ' tickets#create'
  delete '/tickets/:id' => 'tickets#destroy'
  put '/tickets/:id' => 'tickets#update'
  get '/tickets/:id' => 'tickets#show'

  post '/event_venues' => 'event_venues#create'
  delete '/event_venues/:id' => 'event_venues#destroy'
  put '/event_venues/:id' => 'event_venues#update'
  get '/event_venues/:id' => 'event_venues#show'

  post '/events' => 'events#create'
  delete '/events/:id' => 'events#destroy'
  put '/events/:id' => 'events#update'
  get '/events/:id' => 'events#show'

  post '/users' => 'users#create'
  delete '/users/:id' => 'users#destroy'
  put '/users/:id' => 'users#update'
  get '/users/:id' => 'users#show'
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
