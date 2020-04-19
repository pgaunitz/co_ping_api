class ProfilesController < ApplicationController
  def show
    profile = User.find(params[:id])
    community = Community.find(User.find(params[:id]).community_id).name
    render json: profile, serializer: ProfileSerializer
  end
end
