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
    end
  end

  namespace :admin do
    resources :admins
  end

  root :to => 'homes#index'


end
