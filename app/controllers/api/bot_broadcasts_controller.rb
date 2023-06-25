class Api::BotBroadcastsController < ApiController
  skip_before_action :verify_authenticity_token
  before_action :set_bot_broadcast, only: [:show]

  def index
    render json: BotBroadcast.all.to_json
  end

  def show
    render json: @bot_broadcast.to_json
  end

  private

  def set_bot_broadcast
    @bot_broadcast = BotBroadcast.find(params[:id])
  end
end
