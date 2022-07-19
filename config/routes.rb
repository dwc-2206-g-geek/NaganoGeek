Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    get 'orders/complete' => 'orders#complete', as: 'complete'
    post 'orders/confirm' => 'orders#confirm', as: 'confirm'
    resources :orders, only: [:new, :create, :index, :show]
  end

  namespace :admin do
    resources :orders, only: [:show, :update] do
      resources :order_details, only: [:update]
    end
  end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
