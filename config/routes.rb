Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "stays#index"
  resources :stays, only: [:index, :show]

end
