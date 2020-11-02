Rails.application.routes.draw do

  get 'home/about' => 'homes#about', as: 'about'
  root 'homes#top'
  devise_for :users
  resources :users, only: [:show,:index,:edit,:update]
  resources :books
  # root :to => 'homes#top'
  # get 'homes/top'
  # get 'homes/about'
end


#   Rails.application.routes.draw do
#   # get 'homes/index'
#   # get 'homes/show'
#   get 'home/top'
#   get 'home/about'

#   root :to => 'home#top'
#   devise_for :users
#   resources :books
#   resources :profile_images
#   resources :users
# end