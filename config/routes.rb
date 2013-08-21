HmrcContacts::Application.routes.draw do
  namespace :admin do
    root to: 'dashboards#show', via: :get

    resources :contact_records
  end

  root to: 'pages#home', via: :get
end
