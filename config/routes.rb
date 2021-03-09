Rails.application.routes.draw do
  devise_for :users

  root to: "items#index"
  resources :items, except: [:index] do
    collection do
      get 'search'
    end
    resources :orders, only: [:index]
  end
end
