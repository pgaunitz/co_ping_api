# frozen_string_literal: true

class PongsController < ApplicationController
  before_action :authenticate_user!
  def create
    if !pong_params['ping_id'].nil? && !pong_params['user_id'].nil?
      if Ping.all.find(pong_params['ping_id']).active
        pong_creator
      else
        error_handler('This trip is no longer active')
      end
    else
      error_handler('Something went wrong, better luck next time!')
    end
  end

  private

  def pong_params
    params.require(:pong).permit(:item1, :item2, :item3, :user_id, :ping_id)
  end

  def pong_creator
    pong = Pong.create(pong_params)
    if pong.persisted?
      render json: { message: 'Your request was added to this trip' }
    else
      error_handler('You have to specify what items you need')
    end
  end

  def error_handler(error)
    render json: { message: error }, status: 422
  end
end
