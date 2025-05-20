Rails.application.routes.draw do
  devise_for :users

  # ✅ Ensure API routes take priority
  namespace :api do
    resources :jobs, only: [:create]
  end

  root "job_applications#index"

  resources :job_applications do
    collection do
      get 'calendar', to: 'job_applications#calendar', as: 'calendar'
    end
  end

  resources :resumes
end
