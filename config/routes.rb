Rails.application.routes.draw do

  devise_for :admins
   namespace :admin do
      get '/' => 'homes#top'

      get '/genres' => 'genres#index'

      post '/genres' => 'genres#create'

      get '/genres/:id/edit' => 'genres#edit' ,as: 'edit_genres'

      patch '/genres/:id/update' => 'genres#update',as: 'update_genres'

      resources :items , except:[:destroy]

   end
end
