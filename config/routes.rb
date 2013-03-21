Sallyport2::Application.routes.draw do
  
  devise_for :members

   root :to => 'homes#index'
   get :contact_us, :to => 'homes#contact_us'
   post :send_message, :to => 'homes#send_message'

   resources :dances, :only => [:index, :show]
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
