Rails.application.routes.draw do
  
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get "users/show" => "users#show"
end
