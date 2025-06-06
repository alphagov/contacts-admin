Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/healthcheck/live", to: proc { [200, {}, %w[OK]] }
  get "/healthcheck/ready", to: GovukHealthcheck.rack_response(
    GovukHealthcheck::ActiveRecord,
  )

  # Permanently redirect any requests for the root URL to /admin
  root to: redirect("/admin", status: 301)

  mount GovukPublishingComponents::Engine, at: "/component-guide"

  namespace :admin do
    root to: "contacts#index", via: :get

    resources :contact_groups
    resources :contacts do
      member do
        get :clone
        get "/delete", to: "contacts#delete"
      end
      scope module: "contacts" do
        resources :contact_form_links
        resources :email_addresses
        resources :post_addresses
        resources :phone_numbers
      end
    end
  end
end
