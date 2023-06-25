Rails.application.routes.draw do
  namespace :api do
    resources :protocols, only: [:show, :index]
    resources :bot_broadcasts, only: [:show, :index]
    resources :events, only: [:show, :index]
  end

  devise_for :users
  devise_scope :user do
    get "connexion", to: "devise/sessions#new"
    get "creation-de-compte", to: "devise/sessions#create"
  end

  authenticate :user do
    mount Avo::Engine, at: Avo.configuration.root_path
  end

  telegram_webhook TelegramWebhooksController, :default
end
