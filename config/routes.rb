Rails.application.routes.draw do
  root 'high_voltage/pages#show', id: 'home'

  resources :recipes do
    collection do
      get :with_mealtype
    end
  end
  resources :meal_plans


end
