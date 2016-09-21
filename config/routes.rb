Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  %w(
    age
    marital_status
    income
  ).each do |question|
    resources "#{question}_question".to_sym
  end
  resources :decision
end
