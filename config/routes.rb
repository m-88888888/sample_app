Rails.application.routes.draw do
  get 'password_rests/new'
  get 'password_rests/edit'
  get 'sessions/new'
  root 'static_pages#home'
  get '/help', to:'static_pages#help'
  get '/about', to:'static_pages#about'
  get '/contact', to:'static_pages#contact'
  get '/signup', to:'users#new'
  post '/signup', to:'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_rests,      only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end

# Rails.application.routes.draw do
#   root                'static_pages#home'
#   get    'help'    => 'static_pages#help'
#   get    'about'   => 'static_pages#about'
#   get    'contact' => 'static_pages#contact'
#   get    'signup'  => 'users#new'
#   get    'login'   => 'sessions#new'
#   post   'login'   => 'sessions#create'
#   delete 'logout'  => 'sessions#destroy'
#   resources :users do
#     member do
#       get :following, :followers
#     end
#   end
#   resources :account_activations, only: [:edit]
#   resources :password_resets,     only: [:new, :create, :edit, :update]
#   resources :microposts,          only: [:create, :destroy]
#   resources :relationships,       only: [:create, :destroy]
# end