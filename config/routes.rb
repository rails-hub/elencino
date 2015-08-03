Elencino::Application.routes.draw do

  devise_for :users, :skip => :registerable

  devise_scope :user do
    # match '/admin/users', to: 'admin/users#create', via: :post
  end

  resources :homes do
    collection do
      get :masterplan
      get :amenidades
      get :gallery
      get :disponibilidad
      get :facilidades
      get :cotizador
      get :contacto
      get :send_email
      get :quotation
    end

    member do
      get :download_quote
    end
  end

  resources :phases do
    member do
      get :blocks
    end
  end

  resources :blocks do
    member do
      get :lots
    end
  end

  namespace :admin do
    get '/' => 'admins#index'
    resources :admins
    resources :users
    resources :managers
    resources :salesmans
    resources :clients
    resources :lots
    resources :phases do
      member do
        get :details
        post :import
      end
    end

  end

  root :to => 'homes#index'


end
