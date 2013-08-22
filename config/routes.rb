HmrcContacts::Application.routes.draw do
  namespace :admin do
    root to: 'dashboards#show', via: :get

    resources :contacts
    resources :contact_records
  end

  get 'search', to: 'pages#search'
  get 'contact_list', to: 'pages#contact_list'
  root to: 'pages#home', via: :get
end
