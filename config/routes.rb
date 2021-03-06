Rails.application.routes.draw do
  post 'twilio/sms'
  devise_for :users
  
  resources :quotes
  resources :leads
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Authenticates Blazer Using Devise
  authenticate :user, ->(user) { user.employee_role? } do
    mount Blazer::Engine, at: "blazer"
  end

  # # If Above Doesn't Work Then Uncomment Below:
  # mount Blazer::Engine, at: "blazer"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#index"
  get "residential" => "pages#residential"
  get "commercial" => "pages#commercial"
  get "quotes" => "pages#quote"
  get "/intervention" => "intervention#intervention"

  get "/index" => "pages#index"

  # /quotes is the action from the form in quote.html.erb
  post "/quotes" => "quotes#create"

  # /leads is the action from the form in index.html.erb
  post "/leads" => "leads#create"

  #intervention
  resources :interventions
  get 'update_buildings', to: 'intervention#update_buildings'
  get 'update_batteries', to: 'intervention#update_batteries'
  get 'update_columns', to: 'intervention#update_columns'
  get 'update_elevators', to: 'intervention#update_elevators'
  post '/intervention', to: 'intervention#create'
end
