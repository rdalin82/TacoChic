Rails.application.routes.draw do
  # get 'menus/index'
  #
  # get 'menus/new'
  #
  # get 'menus/show'
  resources :menus do
    resources :items, only: [:new, :create, :show, :edit, :update, :destroy]
    resources :categories, only: [:new, :create, :show, :edit, :update, :destory]
  end
  root 'home#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
