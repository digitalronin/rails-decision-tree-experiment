Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :questions do
    %w(
      age
      marital_status
      income
    ).each do |question|
      resources "#{question}_question".to_sym, only: [:edit, :update]
    end
  end

  resources :decision
end
