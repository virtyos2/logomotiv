ActionController::Routing::Routes.draw do |map|
  map.resources :albums


  map.resources :users


  #map.connect 'admin', :controller => :admin, :action => :index
  map.namespace :admin do |admin|
    admin.root :controller => :pages, :action => :new
    admin.connect 'pages/list_parent/:id', :controller => :pages, :action => :list_parent
    admin.connect 'pages/up', :controller => :pages, :action => :up
    admin.connect 'pages/down', :controller => :pages, :action => :down
    admin.connect 'pages/sort', :controller => :pages, :action => :sort
    admin.connect 'items/list/:page_id', :controller => :items, :action => :list
    admin.connect 'pages/context_menu/:id', :controller => :pages, :action => :context_menu
    admin.connect 'items/add_related_item_to_item/:id', :controller => :items, :action => :add_related_item_to_item
    admin.connect 'items/remove_item_relation/:id', :controller => :items, :action => :remove_item_relation
    admin.resources :pages
    admin.resources :news
    admin.resources :posts
    admin.resources :blocks
    admin.resources :albums
    #admin.resources :sessions
    admin.logout 'logout', :controller => 'sessions', :action => 'destroy'
    admin.login 'login', :controller => 'sessions', :action => 'new'
    admin.signin 'signin', :controller => 'sessions', :action => 'create'
  end
  #map.resources :attachment_path_with_session_information, :controller => :ckeditor
=begin
  def full_route(pages, page)
    route = []
    route << page.permalink
    while page.parent_id != 0 do
      route << page.parent.permalink
      page = page.parent
    end
    url = ""
    route = route.reverse
    route.each do |r|
      url = url + r + "/"
    end
    return url
  end
=end
#  map.connect 'ckeditor/:action', :controller => :ckeditor, :action => :action
  #map.connect 'ckeditor/:action/:id'
  #map.resources :pages
  #map.connect '*path', :controller => :redirect, :path => /a-z0-9\//i
  map.resources :pages
  Page.all.each do |p|
    map.connect p.path, :controller => :pages, :action => :show, :id => p.id unless p.path.nil?
  end
  
end
