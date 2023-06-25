class Api::EventsController < ApiController
  skip_before_action :verify_authenticity_token
  before_action :set_event, only: [:show]

  def index
    render json: Event.all.to_json
  end

  def show
    render json: @event.to_json
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
