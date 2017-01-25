Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  get 'welcome/index'

  put 'students/set_tutor'

  resources :tutors
  resources :students
  resources :coordinators
end
