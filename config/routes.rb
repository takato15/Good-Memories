Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords,], controllers: {
    registrations: "customer/registrations",
    sessions: 'customer/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  #顧客
  root to: "customer/plans#index"
  get "/about" => "customer/homes#about"
  get "/photographs" => "customer/homes#index"

  scope module: :customer do

    resource :customers, only: [:show, :edit, :update] do
      collection do
        get "unsubsclibe"
        patch "withdraw"
      end
    end

    resources :plans, only: [:index, :show, :create] do
      collection do
        get "flow"
        get "bridal"
        get "seizinshiki"
        get "maternity"
        get "child"
        get "trip"
        get "couple"
        get "shichigosan"
        get "friend"
      end
    end

    resources :reserves, except: [:update, :destroy, :edit] do
      collection do
        post "confirm"
        post "back"
        get "complete"
      end
    end

    resources :contacts do
      collection do
        post "confirm"
        post "back"
        get "complete"
      end
    end

    resources :calenders, only: [:index]

  end

  # 管理者
  namespace :admin do

    resources :homes
    resources :tags, except: [:show, :new]
    resources :customers, except: [:new, :create, :destroy]
    resources :reserves, only: [:index, :show]
    resources :contacts, except: [:show, :new, :destroy]
    resources :calenders, only: [:index, :new, :create]

  end

end
