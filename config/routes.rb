Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :artists
  resources :types
  resources :images
  resources :comments
  resources :messages

  patch '/comments/:id/addlike', to: 'comments#addlike'
  patch '/comments/:id/unlike', to: 'comments#unlike'


end
