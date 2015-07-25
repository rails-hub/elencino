Elencino::Application.routes.draw do

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

  root :to => 'homes#index'


end
