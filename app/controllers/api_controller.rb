class ApiController < ApplicationController
  TOKEN = Rails.application.credentials.config.dig(:api, :token)

  skip_before_action :authenticate_user!
  before_action :authenticate_with_token

  private

  def authenticate_with_token
    authenticate_or_request_with_http_token do |token, options|
      # Compare the tokens in a time-constant manner, to mitigate
      # timing attacks.
      ActiveSupport::SecurityUtils.secure_compare(token, TOKEN)
    end
  end
end
