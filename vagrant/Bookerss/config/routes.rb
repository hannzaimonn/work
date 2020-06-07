Rails.application.routes.draw do


  devise_for :users
  devise_scope :user do
  	get 'user/sign_up' => 'devise/registrations#new'
  end
  get 'infos/new'
  get '/home/about' => "hed#about"
  root 'hed#top'


  resources :users, only: [:index,:show, :edit,:update,]
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
