Rails.application.routes.draw do

  # All steps in the decision tree should be listed here
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
