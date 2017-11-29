class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @profile = current_user.profile

    if @profile
      render :index
    else
      render :index_no_profile
    end
  end
end
