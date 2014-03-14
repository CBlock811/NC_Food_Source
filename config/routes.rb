NCFoodSource::Application.routes.draw do
  
  devise_for :admins
  resources :suppliers

  devise_for :users
  
  match "about", to: 'welcome#about', via: :get
  match "blog", to: 'welcome#blog', via: :get
  match "contact", to: 'welcome#contact', via: :get

  root to: 'welcome#index'
  
end
