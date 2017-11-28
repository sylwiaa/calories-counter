class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    # @set_calories_by_meal_types = current_user.meals.group(:meal_type).sum(:calories)
  end
end
