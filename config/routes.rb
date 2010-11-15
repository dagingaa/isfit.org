WwwIsfitOrg::Application.routes.draw do  


  resources :tips_osses

  resources :isfit_media_links

  scope "(/:tab)" do
    resources :sublinks
    resources :hosts do 
      collection do 
        get :done
      end
    end
    resources :pages

    resources :articles do
      collection do
       get :new_pic
       get :crop_main
       get :all
      end
    end
    
    resources :workshops

    resources :participants
    
    resources :dialogue_participants

    resources :chronicles do
	collection do
	  get :all
	end
	end

    resources :photos do
      member do
        get :crop
      end
    end

    resources :positions do
      collection do
       get :apply
       post :validate
      end
    end 
    resources :events      

    get "donations/donate", :controller => "donations", :action => "donate"

   get "donations/thank_you", :controller => "donations", :action => "thank_you"


    resources :wop_propositions
  end
  
  resources :events

  match ':tab/events/:year/:month/:day' => 'events#showDate', :as => :events

  match 'opptak' => "positions#index", :tab => "admission"
   match 'apply/position' => "positions#index", :tab => "admission"
  match 'wop' => redirect("http://www.isfit.org/wop/wop_propositions/new")
  root :to => "articles#index" , :tab=>"news"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get :recent, :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  match ':tab(/:controller(/:action(:id)))', :id => /.*/



  match 'events/:year/:month/:day' => 'events#show', :as => :events


end
