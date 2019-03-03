Rails.application.routes.draw do
  resources :contractors do
    member do
      post 'interest_request'
    end
  end
  resources :projects do
    member do
      get 'matching_contractors'
      post 'interest_request'
      post 'project_request'
    end
  end
end
