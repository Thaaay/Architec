Rails.application.routes.draw do
  get "contacts/create"

  root 'pages#home'

  resources :projects
  get '/admin', to: 'admin#dashboard'
  get '/contact', to: 'pages#contact'
  get '/studio', to:'pages#studio'
  post '/contact', to: 'contacts#create', as: 'contact_submissions'

end