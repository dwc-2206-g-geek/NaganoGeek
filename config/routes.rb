Rails.application.routes.draw do

  namespace :admin do
    get 'homes/top'
  end
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

 # 管理者用
 # URL /admin/sign_in ...
 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
   sessions: "admin/sessions"
 }

  scope module: :public do
    root :to =>"homes#top"
    get "/about" => "homes#about"
    get 'customers/my_page', to: 'customers#show', as: 'my_page'
    get '/customers/information/edit', to: 'customers#edit', as: 'edit'
    get '/customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw', as: 'withdraw'
    resources :customers, only: [:show, :edit, :update]

    resources :items, only: [:index, :show]

    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all'
    resources :cart_items, only: [:create, :destroy, :update, :index]


    get 'orders/complete' => 'orders#complete', as: 'complete'
    post 'orders/confirm' => 'orders#confirm', as: 'confirm'
    resources :orders, only: [:new, :create, :index, :show]

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]

    get '/' => 'homes#top', as: 'top'

    resources :items, except: [:destroy]

    resources :genres, only: [:index, :create, :edit, :update]

    resources :orders, only: [:show, :update] do
      resources :order_details, only: [:update]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
