class CommunitiesController < ApplicationController

  def index
    id = Community.all.where('code'==params['q'])
    render json: { community_id: id.first.id } 
    
  end
end