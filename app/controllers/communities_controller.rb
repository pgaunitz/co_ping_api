# frozen_string_literal: true

class CommunitiesController < ApplicationController
  before_action :authenticate_user!
  def index
    id = Community.all.select { |community| community.code == params['q'] }.first.id
    render json: { community_id: id }
  rescue StandardError => e
    render json: { message: 'There is unfortunately no community with this code, did you type it correctly?' }
  end

  def update
    render json: { message: 'User is now accepted to your community.' }
  end
end
