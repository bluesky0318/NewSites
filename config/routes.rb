Rails.application.routes.draw do
  devise_for :users
  resources :statuses
  resources :statussolutions
  resources :downloadcetres
  resources :projectcomments
  resources :projectcclists
  resources :projectfiles
  resources :releasecenters
  resources :issueboards
  resources :categoryfiles
  resources :bugreasons
  resources :customerlists
  resources :osplatforms
  resources :categoryprojects
  resources :hwplatforms
  resources :projectcontrols
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  to: 'home#index'
  get   'mainpages/index'
  get   'releasecenters/index'
end
