class PingsController < ApplicationController
  def create
    ping = Ping.create(ping_params)
    render json: { message: 'Your trip is now active'}
  end
end
