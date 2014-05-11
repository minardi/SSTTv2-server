SSTaskTracker::Application.routes.draw do

  get '/users/sign_up', to: redirect('/users/sign_in')

  devise_for :users
  
  get 'backlog_items/get_items/:item_type/:status/:parent_id' => 'backlog_items#get_items'

  get 'backlog_items/get_active_sprint/:parent_id' => 'backlog_items#get_active_sprint'
  put 'backlog_items/get_active_sprint/:parent_id/:id', to: redirect('backlog_items/%{id}')
  post 'backlog_items/get_active_sprint/:parent_id', to: redirect('backlog_items/%{parent_id}')
  patch 'backlog_items/get_active_sprint/:parent_id/:id', to: redirect('backlog_items/%{id}')
  
  get 'backlog_items/get_tasks/:sprint_id' => 'backlog_items#get_tasks'

  get 'projects/info/:id' => 'projects#get_project_info'
  
  get 'tasks/for-project/:id' => 'tasks#get_tasks'
   
  get "projects/for-user/:id" => "projects#get_projects"

  get "stories/for-project/:id" => "stories#index" 

  get "active-stories/for-project/:id" => "stories#get_stories_for_sprint"

  get "teams-candidates/for-team/:id" => "users#get_all", as: :user

  get "teams/for-project/:id" => "teams#get_teams"

  get 'users/for-team/:id' => 'team_members#get_team_members', as: :team_member

  get 'users/get_roles' => 'users#get_roles'

  get 'users/get_role/:id' => 'users#get_role'
   
  resources :projects
  
  resources :backlog_items

  resources :stories

  resources :teams

  resources :tasks

  resources :sprints

  resources :team_members

  get ':params(/:tmp(/:tmp))' => 'app#main'

  get "app/main"

  root 'app#main'

  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with 'rake routes'.

  # You can have the root of your site routed with 'root'
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
