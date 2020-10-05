Rails.application.routes.draw do
  
  root 'static_pages#home'
  get '/sigup', to:'users#new'
end
