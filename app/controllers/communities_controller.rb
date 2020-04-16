# frozen_string_literal: true

class CommunitiesController < ApplicationController
  before_action :authenticate_user!, only: [:update]
  before_action :is_user_admin, only: [:update]
  def index
    id = Community.all.select { |community| community.code == params['q'] }.first.id
    render json: { community_id: id }
  rescue StandardError => e
    render json: { message: 'There is unfortunately no community with this code, did you type it correctly?' }
  end

  def update
    if accept_user? == 'accepted'
      update_user_community_status
      render json: { message: 'User is now accepted to your community' }
    else
      update_user_community_status
      render json: { message: 'User is now rejected from your community' }
    end
  end

  private

  def user_admission
    params.require(:user_admission).permit(:community_id, :community_status, :user_id )
  end

  def accept_user?
    user_admission['community_status']
  end

  def update_user_community_status
    user = User.all.find(user_admission['user_id']).update(community_status: accept_user? )
  end

  def is_user_admin
    if current_user.role == "admin"
    else
      render json: { message: 'You are not authorized to do this, ask your admin' },
      status: 401
    end
  end
end
