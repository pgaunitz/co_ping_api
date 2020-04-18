# frozen_string_literal: true

class PongsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_part_of_community?
  before_action :verify_ping_and_user, only: [:create]
  before_action :get_pong_owner, only: [:create]
  before_action :get_ping, only: [:create]

  def create
    if @pong_owner.has_active_pongs?
      render_error('You can only have one active request')
    elsif @ping.active
      create_pong
    else
      render_error('This trip is no longer active')
    end
  end

  def update
    Pong.all.find(params[:id]).update(status: params['pong']['status'])
    ping = Ping.all.find(params['pong']['ping_id'])
    render json: ping, serializer: PingShowSerializer
  end

  def destroy
    pong = User.find(params[:id]).pongs.last.destroy
    render json: { message: 'Your request is removed' }
  end

  private

  def is_part_of_community?
    if current_user.community_status == 'accepted'
    else
      render json: { message: 'You are not part of a community yet, ask your admin for more information' }, status: 401
    end
  end

  def pong_params
    params.require(:pong).permit(:item1, :item2, :item3, :user_id, :ping_id)
  end

  def missing_params?
    pong_params['ping_id'].nil? || pong_params['user_id'].nil?
  end

  def verify_ping_and_user
    if missing_params?
      render_error('Something went wrong, better luck next time!')
    end
  end

  def get_pong_owner
    @pong_owner = User.find(pong_params['user_id'])
  end

  def get_ping
    @ping = Ping.find(pong_params['ping_id'])
  end

  def create_pong
    pong = Pong.create(pong_params)
    if pong.persisted?
      render json: { message: "Now wait for your neighbour's reply" }
    else
      render_error('You have to specify what items you need')
    end
  end

  def render_error(error)
    render json: { message: error }
  end
end
