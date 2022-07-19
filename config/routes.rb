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
   resources :items, only: [:index, :show]
   root :to =>"homes#top"
  end

  namespace :public do
    resources :customers, only: [:show, :edit, :unsubscribe]
  end


  scope module: :public do
   resources :items, only: [:index, :show]
   root :to =>"homes#top"
  end

  namespace :admin do
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
end
