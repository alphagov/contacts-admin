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

  root to: 'pages#home', via: :get
end
