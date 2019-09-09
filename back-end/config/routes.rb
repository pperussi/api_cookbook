Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root to: 'recipes#index'
      resources :recipes, only: %i[show create update destroy]
    end
  end
end
