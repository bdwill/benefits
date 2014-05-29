ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.
  
  # Sample of regular route:
  # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  # map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # You can have the root of your site routed by hooking up '' 
  # -- just remember to delete public/index.html.
  # map.connect '', :controller => "welcome"
  
  # Authentication
  map.resource :user_session
  map.root :controller => "user_sessions", :action => "new"
  
  # Users
  map.resource :account, :controller => "users"
  map.resources :users
  
  # Offices
  map.resources :offices, :controller => 'office'
  
  # Benefits
  map.resources :benefits, :controller => 'verify', :member => { :signoff => [:get, :post], :display_comment_form => :get, :create_comment => :post }, :collection => { :list_active => [:get, :post] }

  # Allow downloading Web Service WSDL as a file with an extension
  # instead of a file named 'wsdl'
  map.connect ':controller/service.wsdl', :action => 'wsdl'

  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id'
  
  # allow for searching view the route
        map.connect 'search/:search_terms/:count', :controller => 'search', :action => 'index', :count => '-1' 

        # allow for Open Search RSS feeds searching
        map.connect 'rss/opensearch/description.xml', :controller => 'search', :action => 'description'
        map.connect 'rss/opensearch/:search_terms/:count', :controller => 'search', :action => 'rss', :count => '-1'  
end
