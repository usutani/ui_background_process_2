Rails.application.routes.draw do
  resources :converts, only: %i[ index create ]
  root to: "converts#index"
end
