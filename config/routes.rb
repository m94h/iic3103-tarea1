Rails.application.routes.draw do
  root 'noticia#index'

  get 'noticia/admin'
  resources :noticia


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
