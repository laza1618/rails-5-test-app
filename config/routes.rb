Rails.application.routes.draw do
  get 'manager/new'

  get 'manager/edit'

  get 'manager/update'

  get 'employees/new'

  get 'employees/edi'

  get 'employees/update'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'users#index'

  resources :users, only: [:index, :new, :create] do
    member do
      post :level_up
      post :hit_against_wall
    end
    collection do
      post :set_level_up
      post :set_hit_against_wall
      get :search
    end
  end
  resources :employees, only: [:new, :edit, :update]
  resources :managers, only: [:new, :edit, :update]
  resources :interns, only: [:new, :edit, :update]
end
