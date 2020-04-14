class PongsController < ApplicationController
  before_action :authenticate_user!
  def create
    if Ping.all.find(pong_params['ping_id']).active
      pong = Pong.create(pong_params)
      render json: { message: 'Your request was added to this trip' }
    else
      render json: { message: 'This trip is no longer active' },
      status: 422
    end
  end

  private

  def pong_params
    params.require(:pong).permit(:item1, :item2, :item3, :user_id, :ping_id)
  end
end
