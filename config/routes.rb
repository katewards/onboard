Onboard::Application.routes.draw do
  
  get "users/new"
  # hook up urls with rooms controller
  resources :rooms

  # sign up our users to the site
  resources :users

  # log in and log out of our site
  # it's a singular resource because we can only do one session
  resource :session

  # go to the homepage
  root "rooms#index"


end
