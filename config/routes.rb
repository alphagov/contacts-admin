HmrcContacts::Application.routes.draw do
  namespace :admin do
    root to: 'dashboards#show', via: :get

    resources :contacts
    resources :contact_records do
      scope module: 'contact_records' do
        resource :more_info_website
        resource :more_info_email_address
        resource :more_info_post_address
        resource :more_info_number

        resources :websites
        resources :email_addresses
        resources :post_addresses
        resources :numbers
      end
    end
  end

  root to: 'pages#home', via: :get
end
