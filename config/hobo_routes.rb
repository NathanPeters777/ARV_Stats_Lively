# This is an auto-generated file: don't edit!
# You can add your own routes in the config/routes.rb file
# which will override the routes in this file.

ARVStats::Application.routes.draw do


  # Resource routes for controller groups
  resources :groups


  # Resource routes for controller group_memberships
  resources :group_memberships, :only => [:create, :update, :destroy]


  # Resource routes for controller targets
  resources :targets, :only => [:new, :edit, :show, :create, :update, :destroy]

  # Owner routes for controller targets
  resources :groups, :as => :group, :only => [] do
    resources :targets, :only => [] do
      get '/', :on => :new, :action => 'new_for_group'
      collection do
        post '/', :action => 'create_for_group'
      end
    end
  end


  # Resource routes for controller trials
  resources :trials, :only => [:new, :edit, :show, :create, :update, :destroy]

  # Owner routes for controller trials
  resources :targets, :as => :target, :only => [] do
    resources :trials, :only => [] do
      get '/', :on => :new, :action => 'new_for_target'
      collection do
        post '/', :action => 'create_for_target'
      end
    end
  end


  # Resource routes for controller users
  resources :users, :only => [:edit, :show, :create, :update, :destroy] do
    collection do
      get 'complete_name'
    end
    member do
      get 'account'
      put 'accept_invitation', :action => 'do_accept_invitation'
      get 'accept_invitation'
      put 'reset_password', :action => 'do_reset_password'
      get 'reset_password'
    end
  end

  # User routes for controller users
  post 'login(.:format)' => 'users#login', :as => 'user_login_post'
  get 'login(.:format)' => 'users#login', :as => 'user_login'
  get 'logout(.:format)' => 'users#logout', :as => 'user_logout'
  get 'forgot_password(.:format)' => 'users#forgot_password', :as => 'user_forgot_password'
  post 'forgot_password(.:format)' => 'users#forgot_password', :as => 'user_forgot_password_post'

  namespace :admin do


    # Resource routes for controller admin/users
    resources :users do
      collection do
        post 'invite', :action => 'do_invite'
        get 'invite'
      end
    end

  end

  namespace :concerns do

  end

end
