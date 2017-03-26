Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  get 'welcome/index'

  put 'students/set_tutor'
  put 'tutors/add_student'
  patch 'tutors/:id/tags/update', to: 'tutors#update_tags', as: 'update_tags'

  resources :affiliates
  resources :coordinators
  resources :exams
  resources :students
  resources :tutors
  resources :tutor_comments
  resources :tutoring_sessions
  resources :tags
end
