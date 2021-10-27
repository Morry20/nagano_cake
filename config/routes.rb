Rails.application.routes.draw do

  devise_for :admins
   namespace :admin do
      get '/' => 'homes#top'

      get '/genres' => 'genres#index'

      post '/genres' => 'genres#create'

      get '/genres/:id/edit' => 'genres#edit' ,as: 'edit_genres'

      patch '/genres/:id/update' => 'genres#update',as: 'update_genres'

      resources :items , except:[:destroy]

      resources :customers , except:[:new,:create,:destroy]

      resources :orders , only:[:show]


   end

  devise_for :customers
    scope module: :public do
      get '/' => 'homes#top'
      
      get '/about' => 'homes#about'
  end

end
