ActionController::Routing::Routes.draw do |map|
  map.resources :shows, :member => {:join => :post, :kick => :put, :archive => :put, :unarchive => :put}, :collection => {:archived => :get, :feed => :get}

  map.root :shows

  map.signup 'signup', :controller => 'users', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  map.login 'login', :controller => 'sessions', :action => 'new'

  map.textile_help 'help', :controller => 'application', :action => 'textile_help'

  map.resources :sessions
end

