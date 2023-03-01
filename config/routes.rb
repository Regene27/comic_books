Rails.application.routes.draw do
  root "comic_books#index"

  resources :comic_books do
    resources :borrowers
  end
end
