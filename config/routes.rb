Rails.application.routes.draw do

  root to: "homes#top"
  devise_for :users#deviseを使用する際にURLとしてusersを含む

  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    # resource単数形だと、URLに/:idが含まれなくなる、該当テーブルのparams[:id]を使わなくて良いときに使う
  end

  resources :users, only: [:show, :edit, :update]

  get 'homes/about'=>'homes#about', as:'about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
