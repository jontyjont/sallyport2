Sallyport2::Application.routes.draw do
  
   root :to => 'homes#index'
   get :contact_us, :to => 'homes#contact_us'

   resources :dances, :only => [:index, :show]
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
