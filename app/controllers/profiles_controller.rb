class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def show
    profile = User.find(params[:id])
    render json: profile, serializer: ProfileSerializer
  end
end
