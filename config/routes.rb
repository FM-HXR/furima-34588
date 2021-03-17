Rails.application.routes.draw do
  devise_for :users

  root to: "items#index"
  resources :items do
    get "/orders" => "orders#new"
    resources :orders, only: [:create]
    collection do
      get 'search'
    end
  end
end
