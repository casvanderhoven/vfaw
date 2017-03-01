Rails.application.routes.draw do
  root to: 'pages#show', id: 'home'

  resources :recipes do
    collection do
      get :with_mealtype
    end
  end
  resources :meal_plans

end
