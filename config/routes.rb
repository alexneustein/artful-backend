Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :artists
  resources :types
  resources :images
  resources :comments
  resources :messages

  # routes for the homepage top six components
  get '/images-top', to: 'images#indextop'
  get '/artists-top', to: 'artists#indextop'

  # routes to save likes and un-likes
  patch '/comments/:id/addlike', to: 'comments#addlike'
  patch '/comments/:id/unlike', to: 'comments#unlike'
  patch '/images/:id/addlike', to: 'images#addlike'
  patch '/images/:id/unlike', to: 'images#unlike'
  patch '/artists/:id/addlike', to: 'artists#addlike'
  patch '/artists/:id/unlike', to: 'artists#unlike'


end
