Rails.application.routes.draw do

 
  get 'license/upload'
  get 'welcome/catch_404'
  get 'order/index'
  get 'order/show'
  get 'cart/destroy'
  #devise_for :users

  devise_for :users, :controllers => { registrations: 'registrations' }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :vehicles, only:[:index, :show]
  resources :pages ,only:[:show]

  get '/:permalink' , to: 'pages#permalink' , as: 'permalink'


  resources :search ,only:[:index] do
    collection do
      get 'results'
    end
  end

  resources :filter ,only:[:index] do
    collection do
      get 'results'
    end
  end

  resources :category ,only:[:index] do
    collection do
      get 'results'
    end
  end

   post 'cart/create' , to: "cart#create"
   get '/cart/show' ,to: "cart#show", as: 'showcart'
   get '/cart/clear' , to: "cart#clear" , as: 'clear'

   get '/welcome/index' ,to: "welcome#index", as: 'welcome'

   post 'cart/checkout' , to:"cart#checkout"

   #match "*path", to: "welcome#catch_404", via: :all

   resources :charges , only: [:new , :create]

    # get '/charges/new' , to: "charges#new", as: 'new_charge'

    # get '/charges/create' , to: "charges#create", as: 'create'

    get 'license/form' , to: "license#form" , as: 'form'
    get 'license/upload' 

  root to: 'vehicles#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
end
