class Api::ProtocolsController < ApiController
  before_action :set_protocol, only: [:show]

  def index
    render json: Protocol.all.to_json
  end

  def show
    render json: @protocol.to_json
  end

  private

  def set_protocol
    @protocol = Protocol.find(params[:id])
  end
end
