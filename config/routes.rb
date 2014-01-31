Contacts::Application.routes.draw do
  get "healthcheck" => "healthcheck#check"
  scope :path => "#{APP_SLUG}" do

    namespace :admin do
      root to: 'dashboards#show', via: :get

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
      resources :questions
    end

    scope ':department_id' do
      get "/", to: "contacts#index", as: :contacts

      resources :contacts, constraints: { id: SLUG_FORMAT }, path: '/'
    end

    # DEFAULT TO HMRC
    get "/", to: redirect("/#{APP_SLUG}/hm-revenue-customs", status: 302)
  end

  root to: redirect("/#{APP_SLUG}", status: 302)
end
