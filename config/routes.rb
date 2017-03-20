Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  get 'welcome/index'

  put 'students/set_tutor'
  put 'tutors/add_student'
  post 'tags', to: 'tags#create'

  resources :affiliates
  resources :coordinators
  resources :exams
  resources :students
  resources :tutors
  resources :tutor_comments
end
