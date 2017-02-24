Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  get 'welcome/index'

  put 'students/set_tutor'
  put 'tutors/add_student'

  resources :tutors
  resources :students
  resources :coordinators
  resources :affiliates
end
