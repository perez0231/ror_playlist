Rails.application.routes.draw do
  get 'playlist/index'

  post 'playlist/create'

  get 'playlist/show'

  get 'playlist/edit'

  get 'playlist/update'

  get 'playlist/destroy'

  get 'songs/index' => "songs#index"

  post 'songs' => "songs#create"

  get 'songs/:id' => "songs#show"

  post 'songs/:id/add'=> "songs#add"

  get 'songs/edit'

  get 'songs/update'

  get 'songs/destroy'

  root "users#index"

  post 'users/new' => "users#new"

  post 'users'=> "users#create"

  get 'users/:id'=> "users#show"

  get 'users/edit'

  get 'users/update'

  get 'users/destroy'

  delete 'users/logout'=> "users#logout"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
