class AdminRequest
  def self.matches?(request)
    Contacts.enable_admin_routes
  end
end

Contacts::Application.routes.draw do
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
  get "/government/organisations/:organisation_slug/contact/:id" => "contacts#show", :as => :contact, :constraints => {:id => SLUG_FORMAT }

  get "/contact/:organisation_slug" => "contacts#index", :as => :legacy_contacts
  get "/contact/:organisation_slug/:id" => "contacts#show", :as => :legacy_contact, :constraints => {:id => SLUG_FORMAT }

  # DEFAULT TO HMRC
  root :to => redirect("/government/organisations/hm-revenue-customs/contact", status: 302)
end
