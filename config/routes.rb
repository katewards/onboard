Onboard::Application.routes.draw do
  
  
  # hook up urls with rooms controller
  # order are inside room because we want to place an order on a room
  resources :rooms do
    resources :orders, only: [:new, :create]
  end

   # my list of orders don't have toe be on a room
   resources :orders, only: [:index, :show]


  # sign up our users to the site
  resources :users

  # log in and log out of our site
  # it's a singular resource because we can only do one session
  resource :session

  # go to the homepage
  root "rooms#index"


end
