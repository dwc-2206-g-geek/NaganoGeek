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
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
