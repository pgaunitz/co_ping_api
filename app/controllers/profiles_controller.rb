class ProfilesController < ApplicationController
  def show
    profile = User.find(params[:id])
    render json: { profile: profile }
  end
end
