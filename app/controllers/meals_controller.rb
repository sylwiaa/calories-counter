class MealsController < ApplicationController
  def index
    @meals = Meal.all
  end

  def show
    @meal = Meal.find(params[:id])
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.save
    redirect_to action: 'index'
  end

  def edit
    @meal = Meal.find(params[:id])
  end

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
    redirect_to action: 'index'
  end

  def update
    @meal = Meal.find(params[:id])
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
