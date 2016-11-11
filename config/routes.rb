class AdminRequest
  def self.matches?(request)
    Contacts.enable_admin_routes || ENV["ENABLE_ADMIN_ROUTES"].present?
  end
end

Rails.application.routes.draw do
  get "healthcheck" => "healthcheck#check"

  # Permanently redirect any requests for the root URL to /admin
  root :to => redirect("/admin", status: 301)

  constraints(AdminRequest) do
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
end
