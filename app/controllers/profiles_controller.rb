class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build(profile_params)
    if @profile.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
    @profile = current_user.profile
  end

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
end
