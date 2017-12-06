Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items do
    member do
      patch :close
    end
  end
  root to: 'items#index'
end
