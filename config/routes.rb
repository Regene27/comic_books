Rails.application.routes.draw do
  root "comic_books#index"

  get "/comic_books", to: "comic_books#index"
end
