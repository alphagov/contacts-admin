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

  scope ':department_id' do
    resources :contact_groups
    resources :contacts, constraints: { id: SLUG_FORMAT } do
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

  post 'search', to: 'search#search'

  match ':department_id/contact_us', via: :get, to: 'pages#home'

  root to: 'pages#hmrc', via: :get
end
