class AdminRequest
  def self.matches?(request)
    Contacts.enable_admin_routes || ENV["ENABLE_ADMIN_ROUTES"].present?
  end
end

Rails.application.routes.draw do
  get "healthcheck" => "healthcheck#check"

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

  get "/government/organisations/:organisation_slug/contact" => "contacts#index", :as => :contacts

  # DEFAULT TO HMRC
  root :to => redirect("/government/organisations/hm-revenue-customs/contact", status: 302)
end
