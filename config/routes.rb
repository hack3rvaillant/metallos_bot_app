Rails.application.routes.draw do
  authenticate :user do
    scope :admin do
      mount Avo::Engine, at: Avo.configuration.root_path
    end
  end

  root to: "pages#index"

  devise_for :users
  devise_scope :user do
    get "connexion", to: "devise/sessions#new"
    get "creation-de-compte", to: "devise/sessions#create"
  end

  telegram_webhook TelegramWebhooksController, :default
end
