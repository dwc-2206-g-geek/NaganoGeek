Rails.application.routes.draw do

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
    get 'customers/my_page', to: 'customers#show', as: 'my_page'
    get '/customers/information/edit', to: 'customers#edit', as: 'edit'
    get '/customers/unsubscribe', to: 'customers#unsubscribe', as: 'unsubscribe'
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:create, :destroy, :update, :index]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all'
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
  
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
end
