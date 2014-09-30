Promptly::Application.routes.draw do
  
  devise_for :users, :skip => [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit',   :as => 'edit_user_registration'
    put 'users'      => 'devise/registrations#update', :as => 'user_registration'
  end

  root :to => 'pages#home'


  # match 'logout', :to => 'sessions#destroy', :as => "logout"
    authenticated :user do
      root :to => 'pages#home'
    end

  namespace :admin do
      as :super do
        root to: 'superdashboard#index', as: 'dashboard'
      end
    resources :organizations do
      match 'dashboard', :to => 'dashboard#index', :as => "dashboard"
      resources :users
      resources :recipients
      resources :conversations
      resources :groups
      resources :messages
      resources :organizations
      resources :reminders do
        collection do
          post :confirm
        end
      end
    end

  end


  #project page
  match '/hsa'       => 'pages#hsa'
  match '/documents' => 'pages#documents'

  #autoresponse
  match '/handle-incoming-sms'  => 'auto_response#handle_incoming_sms'
  match '/handle-incoming-call' => 'auto_response#handle_incoming_call'
  match '/handle-input'         => 'auto_response#handle_input'
  match '/english-response'     => 'auto_response#english_response'
  match '/spanish-response'     => 'auto_response#spanish_response'
  match '/cantonese-response'   => 'auto_response#cantonese_response'
end
