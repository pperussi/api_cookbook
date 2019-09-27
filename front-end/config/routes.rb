Rails.application.routes.draw do
  resources :recipes, only: %i[show]
end
