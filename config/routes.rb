Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/jk_admin', as: 'rails_admin'
  resources :hobbies
  resources :driving_licenses
  resources :user_competences
  resources :job_applications
  resources :saved_jobs
  resources :competences do
  get :autocomplete_competence_competence_name, :on => :collection
  end


  resources :languages
  resources :certificates
  resources :experiences
  resources :educations
  resources :jobs
  resources :companies
    devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions', omniauth_callbacks: 'callbacks', passwords: 'passwords' }

  root 'main#home'
  get 'company_user', to: 'main#company'
  get 'worker_home', to: 'main#worker_home'
  get 'company_home', to: 'main#company_home'
  get 'worker_all_jobs', to: 'main#worker_all_jobs'
  get 'profile', to: 'user_profile#index'
  post 'add_profile_image', to: 'user_profile#add_profile_image'
  post 'edit_about_me_text', to: 'user_profile#edit_about_me_text'
  post 'edit_user_name', to: 'user_profile#edit_user_name'
  post 'add_profile_video', to: 'user_profile#add_profile_video'
  get 'driving_license_display', to: 'user_profile#driving_license_display'
  get 'applicants', to: 'job_applications#applicants'
  post 'active_company', to: 'companies#active_company'
  get 'account', to: 'user_profile#account'
  patch 'update_account_info', to: 'user_profile#update_account_info'
  post 'update_other_profile_info', to: 'user_profile#update_other_profile_info'
  #get 'applicant_profile', to: 'job_applications#applicant_profile'
  get '/applicant_profile/:id', to: 'job_applications#applicant_profile', as: 'applicant_profile'
  resource :user_profile
  #CompanyShowJobsController
  get 'my_review_jobs', to: 'company_show_jobs#my_review_jobs'

  get '/linkedin/auth'      => 'linkedin#auth'
  get '/linkedin/callback'  => 'linkedin#callback'

=begin
    resource :main do
        get 'company'
    end
=end
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
