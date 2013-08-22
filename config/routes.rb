HmrcContacts::Application.routes.draw do
  namespace :admin do
    root to: 'dashboards#show', via: :get

    resources :contacts
    resources :contact_records
  end

  get 'search',          to: 'pages#search'
  get 'contact_list',    to: 'pages#contact_list'
  get 'details_1',       to: 'pages#details_1'
  get 'details_2',       to: 'pages#details_2'
  get 'details_3',       to: 'pages#details_3'
  root to: 'pages#home', via: :get
end
