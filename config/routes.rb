Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "shops#index"

  resources :shops, only: [:show] do
    member do
      resources :opening_hours, only: [:index]
    end
  end

  get 'set_locale', to: 'application#set_locale', as: 'set_locale'
end
