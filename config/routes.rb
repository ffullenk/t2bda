T2bda::Application.routes.draw do
  

  match "/productos/search" => "productos#search", :as => "productos_search"
  match "/buscar" =>"home#buscar", :as => "buscar"
  resources :productos


  root :to => "home#index"
end
