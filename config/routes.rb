Rails.application.routes.draw do
   
  devise_for :admins
   namespace :admin do
      get '/admin' => '/admin/homes#top'
   end
end
