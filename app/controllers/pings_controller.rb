class PingsController < ApplicationController
  def create
    ping = Ping.create(ping_params)
    render json: { message: 'Your new trip is now active'}
  end

  private

  def ping_params
      params.require(:ping).permit(:time, :store)
  end
end
