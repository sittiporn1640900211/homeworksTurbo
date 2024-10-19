Rails.application.routes.draw do
  root 'categories#index'
  
  resources :categories do
    resources :tasks
  end
  
  post 'tasks/:id/complete', to: 'tasks#complete', as: 'complete_task'
end