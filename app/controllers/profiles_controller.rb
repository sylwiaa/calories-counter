class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    @profile.update(profile_params)
    render :edit
  end

  private

  def profile_params
    params.require(:profile).permit(:gender, :date_of_birth, :weight, :height, :activity_level, :purpose)
  end

  def current_profile
    current_user.profile || current_user.build_profile
  end
end
