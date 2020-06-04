Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
  	get 'user/sign_up' => 'devise/registrations#new'
  end

  get 'userinfos/new'
  get '/about' => "root#about"

  root 'root#top'

	resources :users, only: [:index,:show, :edit,:update]
	resources :posts
	resources :book_images,only:[:new,:create,:index,:show]

end

