Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :age_question
  resources :marital_status_question
  resources :income_question
  resources :decision
end
