# frozen_string_literal: true

class PingsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_part_of_community?
  before_action :last_ping, only: %i[show]
  before_action :correct_user?, only: %i[update]
  before_action :user_has_uncompleted_ping?, only: %i[create]

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
    if params['ping']['completed']
      @requested_ping.update(completed: true)
      @requested_ping.update(active: false)
      @requested_ping.pongs.update(active: false)
      render json: { message: 'Your trip is completed' }
    else
      @requested_ping.update(active: false)
      @requested_ping.pongs.where(status: 'pending').update(status: 'rejected')
      render json: {
        message:
          "You are ready to go shopping, don't forget the receipts!"
      }
    end
  end

  def show
    if @ping.pongs.any?
      render json: @ping, serializer: PingShowSerializer
    else
      render json: { message: 'Your shopping bag looks light!', ping_id: @ping.id }
    end
  end

  private

  def ping_params
    params.require(:ping).permit(:time, :store, :user_id)
  end

  def last_ping
    if User.find(params[:id]).pings.any?
      @ping = User.find(params[:id]).pings.last
    else
      render json: { message: 'It seems like you have not planned to go shopping yet' }
    end
  end

  def correct_user?
    @requested_ping = Ping.find(params[:id])
    if @requested_ping.user_id == current_user.id
    else
      render json: {
        message: "You are not authorized to update another user's ping"
      },
             status: 401
    end
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

  def user_has_uncompleted_ping?
    if current_user.pings.none? || current_user.pings.last['completed']
    else
      render json: { message: 'You need to complete your current ping before you can create a new one' }
    end
  end
end
