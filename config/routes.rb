Rails.application.routes.draw do

  root 'pages#index'
  resources :books, except: [:new, :edit]

# Prefix Verb   URI Pattern          Controller#Action
#   root GET    /                    pages#index
#  books GET    /books(.:format)     books#index
#        POST   /books(.:format)     books#create
#   book GET    /books/:id(.:format) books#show
#        PATCH  /books/:id(.:format) books#update
#        PUT    /books/:id(.:format) books#update
#        DELETE /books/:id(.:format) books#destroy

end