Rails.application.routes.draw do
  root 'welcome#index'

  get 'welcome/index'

  resources :tutors
  resources :students
end
