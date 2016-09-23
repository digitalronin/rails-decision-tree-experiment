Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :steps do
    [
      :age,
      :marital_status,
      :income,
      :income2,
      :income3
    ].each do |ctrlr|
      resources ctrlr, only: [:edit, :update]
    end
  end

  resources :start, only: [:index]
  resources :check_answers, only: [:edit, :update]
  resources :decision
end
