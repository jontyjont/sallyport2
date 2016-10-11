Sallyport2::Application.routes.draw do
  
  devise_for :members

   root :to => 'homes#index'
   get :contact_us, :to => 'homes#contact_us'
   get :help, :to => 'homes#help'
   get :useful_links, :to => 'homes#useful_links'
   post :send_message, :to => 'homes#send_message'

   resources :dances, :only => [:index, :show]

   resources :services, :only => [] do
     collection do
       get   :new_ip
       post  :set_ip
       get   :tvheadend
     end
   end

   namespace :admin do
   	resources :blurbs, :except => :show

   end


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
