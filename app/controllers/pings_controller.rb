class PingsController < ApplicationController
  def create
    ping = Ping.create(ping_params)
    if ping.persisted?
      render json: { message: 'Your new trip is now active' }
    else
      render json: { message: 'You need to set a time for your new trip' },
             status: 422
    end
  end

  def index
    pings = Ping.all.where(active: true)
    render json: pings, each_serializer: PingIndexSerializer
  end

  private

  def ping_params
    params.require(:ping).permit(:time, :store)
  end
end
