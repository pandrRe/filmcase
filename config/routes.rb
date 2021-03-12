Rails.application.routes.draw do
  root "application#index"

  scope '/api' do
    resources :films, :directors
  end

  get '*path', to: 'application#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
