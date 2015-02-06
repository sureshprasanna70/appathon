Rails.application.routes.draw do
  resources :bugs

  resources :comments

  resources :submodules

  resources :employees

  resources :projects

  devise_for :users
  root 'projects#index'
  get 'projects/:id/submodules/'=>"projects#submodules",:as=>"project_modules"
  get 'submodules/projects/:id'=>"submodules#new",:as=>"new_submodule_for_project"
  get 'comments/new/:id'=>"comments#new",:as=>"new_comment_for_submodule"  
  get 'submodules/bug/:id'=>"submodules#bug",:as=>"bugs_in_submodule"
  get 'bugs/new/:submodule_id'=>"bugs#new",:as=>"new_bug_for_submodule"
  get 'projects/complete/:id'=>"projects#complete",:as=>"complete_story"
end
