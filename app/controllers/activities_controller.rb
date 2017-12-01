class ActivitiesController < ApplicationController
    before_action :authenticate_user!

  def index
    @activities = current_user.activities
  end

  def new
    @activity = current_user.activities.build
  end

  def create
    @activity = current_user.activities.build(activity_params)
    if @activity.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def show
    @activity = current_user.activities.find(params[:id])
  end

  def edit
    @activity = current_user.activities.find(params[:id])

  end

  def update
    @activity = current_user.activities.find(params[:id])
    @activity.update(activity_params)
    if @activity.save
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  def destroy
    @activity = current_user.activities.find(params[:id])
    @activity.destroy
    redirect_to action: 'index'
  end

  private

  def activity_params
    params.require(:activity).permit(:duration, :completed_on, :activity_type)
  end
end
