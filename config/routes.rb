Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/oauth/callback', to: 'oauth#callback'
  get '/login_via_upcall', to: 'oauth#login_via_upcall', as: :login_via_upcall
end
