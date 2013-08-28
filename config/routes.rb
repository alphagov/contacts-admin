HmrcContacts::Application.routes.draw do
  namespace :admin do
    root to: 'dashboards#show', via: :get

    resources :offices
    resources :contacts do
      scope module: 'contacts' do
        resources :contact_form_links
        resources :email_addresses
        resources :post_addresses
        resources :phone_numbers
      end
    end
  end

  get 'search',          to: 'pages#search'
  get 'contact_list',    to: 'pages#contact_list'
  get 'details_1',       to: 'pages#details_1'
  get 'details_2',       to: 'pages#details_2'
  get 'details_3',       to: 'pages#details_3'
  root to: 'pages#home', via: :get
end
