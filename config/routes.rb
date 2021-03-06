Rails.application.routes.draw do

  devise_for :admins,:path => "/admin", controllers: {
  registrations: "admin/registrations",
  sessions: 'admin/sessions'
}
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

  #devise_for :customer

  devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

    scope module: :public do
      get '/' => 'homes#top' ,as: 'root'

      get '/about' => 'homes#about'

      get 'public/customers/my_page' => 'customers#show'

      get 'public/customers/edit' => 'customers#edit'

      patch 'public/customers' => 'customers#update'

      get 'public/customers/unsubscribe' => 'customers#unsubscribe'

      patch 'public/customers/withdraw' => 'customers#withdraw'

      resources :addresses , except:[:new,:show]

      resources :items , only:[:index,:show]

      resources :cart_items , except:[:new,:show,:edit]

      delete '/cart_items' => 'cart_items#destroy_all'

      post '/orders/confirm' => 'orders#confirm'

      get '/orders/complete' => 'orders#complete'

      resources :orders , except:[:edit,:update,:destroy]



  end

end
