Rails.application.routes.draw do
 
  devise_for :users
  root 'imgs#index'
  get 'search',to: "imgs#search"
  resources :imgs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
