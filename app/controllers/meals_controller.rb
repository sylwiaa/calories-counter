class MealsController < ApplicationController
  before_action :authenticate_user!
  def index
    @meals = current_user.meals
    if params[:eaten_on].blank?
      @meals = current_user.meals.limit(10)
    else
      @meals = current_user.meals.where("eaten_on = ?", params[:eaten_on]).limit(10)
    end

    if params[:meal_type].blank?
      @meals = current_user.meals.limit(10)
    else
      @meals = current_user.meals.where("meal_type = ?", params[:meal_type]).limit(10)
    end
  end

  def show
    @meal = current_user.meals.find(params[:id])
  end

  def new
    @meal = current_user.meals.build
    @meal.meal_type = "bebinka"
  end

  def create
    @meal = current_user.meals.build(meal_params)
    @meal.save
    redirect_to action: 'index'
  end

  def edit
    @meal =  current_user.meals.find(params[:id])
  end

  def destroy
    @meal =  current_user.meals.find(params[:id])
    @meal.destroy
    redirect_to action: 'index'
  end

  def update
    @meal =  current_user.meals.find(params[:id])
    if @meal.update(meal_params)
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :quantity, :calories_per_100, :category, :eaten_on, :meal_type)
  end

end
