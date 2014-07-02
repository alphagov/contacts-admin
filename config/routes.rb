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


  get "/#{APP_SLUG}/:organisation_slug" => "contacts#index", :as => :contacts
  get "/#{APP_SLUG}/:organisation_slug/:id" => "contacts#show", :as => :contact, :constraints => {:id => SLUG_FORMAT }

  # DEFAULT TO HMRC
  get "/#{APP_SLUG}" => redirect("/#{APP_SLUG}/hm-revenue-customs", status: 302)
  root :to => redirect("/#{APP_SLUG}/hm-revenue-customs", status: 302)
end
