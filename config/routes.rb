Rails.application.routes.draw do
  resources :widgets

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'welcome#index'

  get '/auth/:provider/callback', :to => 'sessions#create'

  get '/success', :to => 'welcome#success', :controller => 'welcome'

  get '/fetch', :to => 'welcome#fetch', :controller => 'welcome'

end
