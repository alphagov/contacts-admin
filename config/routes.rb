Rails.application.routes.draw do
  get "/healthcheck", to: GovukHealthcheck.rack_response(
    GovukHealthcheck::ActiveRecord,
  )

  # Permanently redirect any requests for the root URL to /admin
  root to: redirect("/admin", status: 301)

  namespace :admin do
    root to: 'contacts#index', via: :get

    resources :contact_groups
    resources :contacts do
      member do
        get :clone
      end
      scope module: 'contacts' do
        resources :contact_form_links
        resources :email_addresses
        resources :post_addresses
        resources :phone_numbers
      end
    end
  end
end
