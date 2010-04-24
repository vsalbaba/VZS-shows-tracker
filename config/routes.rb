ActionController::Routing::Routes.draw do |map|
  map.resources :shows, :member => {:join => :post, :kick => :put}

  map.root :shows

  map.signup 'signup', :controller => 'users', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  map.login 'login', :controller => 'sessions', :action => 'new'

  map.resources :sessions
end

