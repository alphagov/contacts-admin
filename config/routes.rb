HmrcContacts::Application.routes.draw do
  SLUG_FORMAT = /[A-Za-z0-9\-_]+/

  namespace :admin do
    root to: 'dashboards#show', via: :get

    resources :contact_groups
    resources :contacts do
      scope module: 'contacts' do
        resources :contact_form_links
        resources :email_addresses
        resources :post_addresses
        resources :phone_numbers
      end
    end
    resources :questions
  end

  resources :contact_groups
  resources :contacts, constraints: { id: SLUG_FORMAT } do
    match 'information-you-will-need', {
      via: :get,
      to: 'contacts#information_you_will_need',
      as: :information_you_will_need
    }

    match 'contact-details', {
      via: :get,
      to: 'contacts#contact_details',
      as: :contact_details
    }
  end

  post 'search', to: 'search#search'

  root to: 'pages#home', via: :get
end
