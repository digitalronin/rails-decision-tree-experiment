Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :questions do
    [
      :age_question,
      :marital_status_question,
      :income_question
    ].each do |ctrlr|
      resources ctrlr, only: [:edit, :update]
    end
  end

  resources :decision
end
