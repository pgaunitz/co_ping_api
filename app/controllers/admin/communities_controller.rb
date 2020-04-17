# frozen_string_literal: true

class Admin::CommunitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :is_user_admin

  def update
    if accept_user? == 'accepted'
      update_user_community_status
      render json: { message: 'User is now accepted to your community' }
    else
      update_user_community_status
      render json: { message: 'User is now rejected from your community' }
    end
  end

  def index
    pending_community_users = User.all.where(community_id: current_user.community_id).where(community_status: 'pending')
    render json: { requests: pending_community_users }
  end

  private

  def user_admission
    params.require(:user_admission).permit(:community_id, :community_status, :user_id)
  end

  def accept_user?
    user_admission['community_status']
  end

  def update_user_community_status
    user = User.all.find(user_admission['user_id']).update(community_status: accept_user?)
  end

  def is_user_admin
    if current_user.role == 'admin'
    else
      render json: { message: 'You are not authorized to do this, ask your admin' },
             status: 401
    end
  end
end
