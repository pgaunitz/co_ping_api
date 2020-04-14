class PongsController < ApplicationController
  before_action :authenticate_user!
  def create
    pong = Pong.create(pong_params)
    render json: { message: 'Your request was added to this trip'}
  end

  private 

  def pong_params
    params.require(:pong).permit(:item1, :item2, :item3, :user, :ping)
  end
end
