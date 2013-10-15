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

      get 'search', to: 'search#index'
      post 'search', to: 'search#search'


      resources :contacts, constraints: { id: SLUG_FORMAT }, path: '/' do
        get 'information-you-will-need',
            on: :member,
            action: :information_you_will_need,
            as: :information_you_will_need
        get 'contact-details',
            on: :member,
            action: :contact_details,
            as: :contact_details
      end
    end

    # DEFAULT TO HMRC
    get "/", to: redirect("/#{APP_SLUG}/hmrc/search", status: 302)
  end

  root to: redirect("/#{APP_SLUG}", status: 302)
end
