Rails.application.routes.draw do
  root 'pages#home'


  resources :projects

  get 'archway-portal', to: 'sessions#new', as: :login
  post 'archway-portal', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: :logout
  get 'admin', to: 'admin#dashboard', as: :admin_dashboard
  get 'contact', to: 'pages#contact', as: :contact
  get 'studio', to: 'pages#studio', as: :studio
  post 'contact', to: 'contacts#create', as: :contact_submissions
end








