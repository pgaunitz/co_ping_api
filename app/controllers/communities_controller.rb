class CommunitiesController < ApplicationController
  def index
    id = Community.all.select { |community| community.code == params['q'] }.first.id
    render json: { community_id: id }
  rescue StandardError => e
    render json: { message: 'There is unfortunately no community with this code, did you type it correctly?' }, 
      status: 422
  end
end
