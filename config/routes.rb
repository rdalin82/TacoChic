Rails.application.routes.draw do
  devise_for :users
  # get 'menus/index'
  #
  # get 'menus/new'
  #
  # get 'menus/show'
  resources :menus do
    resources :items, only: [:new, :create, :show, :edit, :update, :destroy]
    resources :categories, only: [:new, :create, :show, :edit, :update, :destory]
  end
  get "menus/orders/show"             => "orders#show", as: :show_order
  get "menus/orders/thanks"           => 'orders#thanks'
  post "menus/orders/:item_id/add"    => 'orders#add'
  post "menus/orders/:item_id/remove" => 'orders#remove'
  post "menus/orders/show/submit"          => 'orders#submit'
  root 'home#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
