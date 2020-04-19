class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_profile

  def show
    render json: @profile, serializer: ProfileSerializer
  end

  def update
    params['profile'].keys.each { |attribute| update_profile(attribute) }
    render json: @profile, serializer: ProfileSerializer
  end

  private 

  def find_profile
    @profile = User.find(params[:id])
  end

  def update_profile(attribute)
    @profile.update("#{attribute}": params['profile'][attribute])
  end
end