Rails.application.routes.draw do
  get "/404" => "errors#not_found"
  get "/500" => "errors#internal_server_error"

  # Devise Routes
  devise_for :user, path: 'auth', path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'register',
      sign_up: 'signup'
  }, controllers: {
      # :registrations => 'registrations',
      # :sessions => 'sessions',
      :omniauth_callbacks => 'omniauth_callbacks'
  }

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'

  # Rate
  post '/rate' => 'rater#create', as: :rate

  # Add routes
  get '/quem-somos' => 'about#index', as: :about
  get '/anuncie' => 'ads#index', as: :ads
  get '/ofertas/(:category)' => 'products#list_by_category', as: :list_products_by_category
  get '/ofertas/(:category)/(:subcategory)' => 'products#list_by_subcategory', as: :list_products_by_subcategory
  get '/ofertas/(:category)/(:subcategory)/(:slug)' => 'products#list_by_name', as: :list_products_by_name
  get '/:type_company/:slug' => 'company#index', as: :company
  get '/analytics' => 'analytics#index', as: :analytics

  # search
  get '/search' => 'search#index', as: :search

  mount_rails_db_info as: 'rails_db_info_engine' if Rails.env.development?
end
