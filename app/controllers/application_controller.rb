class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  def after_sign_in_path_for(resource)
    Avo::Engine.routes.url_helpers.resources_artists_path
  end
end
