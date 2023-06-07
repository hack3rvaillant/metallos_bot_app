Rails.application.routes.draw do
  mount Avo::Engine, at: Avo.configuration.root_path
  devise_for :users
  devise_scope :user do
    get "connexion", to: "devise/sessions#new"
    get "creation-de-compte", to: "devise/sessions#create"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  telegram_webhook TelegramWebhooksController, :default
end
