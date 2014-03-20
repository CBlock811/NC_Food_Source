NCFoodSource::Application.routes.draw do
  
  devise_for :users
  devise_for :admins
  resources :suppliers
  
  match "farms", to: 'suppliers#index', via: :get
  match "about", to: 'welcome#about', via: :get
  match "blog", to: 'welcome#blog', via: :get
  match "contact", to: 'welcome#contact', via: :get

  namespace :admin do
    resources :index, :about, :suppliers, :blog, :contact
  end

  root to: 'welcome#index'
  
end
