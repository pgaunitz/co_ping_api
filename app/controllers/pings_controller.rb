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
    if pings.length > 0
      render json: pings, each_serializer: PingIndexSerializer
    else
      render json: { message: "Unfortunately no one has planned to go shopping, so maybe you can?" }
    end
  end

  private

  def ping_params
    params.require(:ping).permit(:time, :store)
  end
end
