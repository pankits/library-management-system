Rails.application.routes.draw do
  get 'bookissues/index'
  get '/rentels/addtocart'
  devise_for :users, :skip => [:registation]
  root 'home#index'
  resources :libraryans
  resources :rentels
  resources :books
  get '/books/:id/issuer', to: 'books#issue', as: :book_issue
  resources :bookissues
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
