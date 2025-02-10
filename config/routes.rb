Rails.application.routes.draw do
  root "job_applications#index"

  resources :job_applications do
    collection do
      get 'calendar', to: 'job_applications#calendar', as: 'calendar'
    end
  end
end
