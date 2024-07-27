Rails.application.routes.draw do
  get 'home/index'
  resources :categories do
    resources :question_answers do 
      collection do
        get :deleted  # This line adds the route for viewing deleted question answers
      end
      member do
        put :restore
      end
    end
  end
  root "categories#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
