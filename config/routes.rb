HmrcContacts::Application.routes.draw do
  SLUG_FORMAT = /[A-Za-z0-9\-_]+/

  namespace :admin do
    root to: 'dashboards#show', via: :get

    resources :offices
    resources :contact_groups
    resources :contacts do
      scope module: 'contacts' do
        resources :contact_form_links
        resources :email_addresses
        resources :post_addresses
        resources :phone_numbers
      end
    end
  end

  resources :contact_groups
  resources :offices, constraints: { id: SLUG_FORMAT } do
    match 'information-you-will-need', {
      via: :get,
      to: 'offices#information_you_will_need',
      as: :information_you_will_need
    }

    match 'contact-details', {
      via: :get,
      to: 'offices#contact_details',
      as: :contact_details
    }
  end

  get 'search',          to: 'pages#search'
  get 'details_1',       to: 'pages#details_1'
  get 'details_2',       to: 'pages#details_2'
  get 'details_3',       to: 'pages#details_3'

  post 'show_contact_group', to: 'pages#search', as: :show_contact_group

  root to: 'pages#home', via: :get
end
