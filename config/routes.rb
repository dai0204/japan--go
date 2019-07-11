Rails.application.routes.draw do
 devise_for :users
 root 'tweets#index'
 post "tweets/new" => "tweets#create"
 get 'tweets/:id/pre' => 'tweets#pre'
 resources :tweets do
  resources :comments, only: [:create]
 end
 resources :users, only: [:show]

 
end  