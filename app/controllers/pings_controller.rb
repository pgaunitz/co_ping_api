# frozen_string_literal: true

class PingsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_part_of_community?

  def create
    ping = Ping.create(ping_params)
    if ping.persisted?
      render json: { message: 'Your new trip is now active' }
    else
      render json: { message: 'You need to set a time for your new trip' }
    end
  end

  def index
    pings = Ping.all.where(active: true)
    if !pings.empty?
      render json: pings, each_serializer: PingIndexSerializer
    else
      render json: {
               message:
                 'Unfortunately no one has planned to go shopping, so maybe you can?'
             }
    end
  end

  def update
    requested_ping = Ping.all.find(params[:id])
    if requested_ping.user_id == current_user.id
      requested_ping.update(active: false)
      render json: { message: 'You are ready to go shopping!' }
    else
      render json: {
               message: "You are not authorized to update another user's ping"
             },
             status: 401
    end
  end

  def show
    ping = Ping.find(params[:id])
    if ping.pongs.where(active: true).any?
      render json: ping, serializer: PingShowSerializer
    else
      render json: { message: 'Your shopping bag looks light!' }
    end
  end

  private

  def ping_params
    params.require(:ping).permit(:time, :store, :user_id)
  end

  def is_part_of_community?
    if current_user.community_status == 'accepted'

    else
      render json: {
               message:
                 'You are not part of a community yet, ask your admin for more information'
             },
             status: 401
    end
  end
end
