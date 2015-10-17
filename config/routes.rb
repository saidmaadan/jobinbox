Rails.application.routes.draw do

  get '/about' =>'pages#about'

  get '/terms' =>'pages#terms'

  get '/privacy' =>'pages#privacy'

  get '/faq' =>'pages#faq'

  get "signin" => "sessions#new"
  
  get '/auth/:provider/callback' => 'sessions#create'
  resource :session
  
  get "signup" => "candidates#new", as: "signup"
  get "candidates/:id/editprofile" => "candidates#editprofile", as: "profile/info"
  resources :candidates do 
    resources :works
    resources :educations
    collection do
      get 'search'
    end
  end

  get "register" => "employers#new", as: "register"
  get "/:id/update-profile" => "employers#editprofile", as: "profile/update"
  get "employers/signup" => "employers#home"

  resources :employers do
    collection do
      get 'search'
    end
  end

  get "companies/:id/review" => "companies#review", as: "company/review"
  get "companies/:id/addreview" => "companies#addreview", as: "company/addreview"
  get "companies/:id/interview" => "companies#interview", as: "company/interview"
  get "companies/:id/addinterview" => "companies#addinterview", as: "company/addinterview"
  get "companies/:id/job" => "companies#job", as: "company/job"
  get "companies/:id/about" => "companies#about", as: "company/about"
  resources :companies do
    collection do
      get 'search'
    end 
    resources :reviews, except: [:show, :index]
    resources :interviews, except: [:show, :index]
  end
  resources :insights

  resources :jobs do
    collection do
      get 'search'
    end
    resources :applies, except: [:show, :index]
  end

  get '/contact' => 'contacts#new'

  resources :contacts

  root "pages#home"

  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
