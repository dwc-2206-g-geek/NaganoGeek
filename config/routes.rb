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

  namespace :public do
    resources :customers, only: [:show, :edit, :unsubscribe]
  end


  scope module: :public do
    resources :cart_items, only: [:create, :destroy, :update, :index] 
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


  