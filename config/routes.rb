Rails.application.routes.draw do
  root to: 'page#show'
  post '/contact' => 'contact#create'
  get '/references' => 'references#index'
end
