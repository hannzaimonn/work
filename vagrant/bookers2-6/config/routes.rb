Rails.application.routes.draw do

  devise_for :users
   devise_scope :user do
  	get 'user/sign_up' => 'devise/registrations#new'
  end
  root 'home#top'
  get '/home/about' => "home#about"

  resources :users,only: [:show,:index,:edit,:update]
  resources :books

end