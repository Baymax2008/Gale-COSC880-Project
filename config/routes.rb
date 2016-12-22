Rails.application.routes.draw do
  get 'lab_approvals/index'

  get 'lab_approvals/show'

  get 'lab_approvals/new'

  get 'lab_approvals/edit'

  get 'lab_approvals/create'

  get 'lab_approvals/update'

  get 'lab_approvals/destroy'

  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/edit'

  get 'users/create'

  get 'users/update'

  get 'users/destroy'

  get 'welcome/index'

  devise_for :users
  resources :systems
  resources :networks
  resources :routers
  resources :encrypters
  resources :tests
  resources :users
  resources :labs
  resources :test_approvals
  resources :system_approvals
  resources :lab_approvals

  root to: 'welcome#index'
end
