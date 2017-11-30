class MealsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_empty_product, only: [:new, :create, :edit, :update]

  def index
    @meals = current_user.meals

    if params[:meal_type].present?
      @meals = @meals.where(meal_type: params[:meal_type])
    end

    if params[:eaten_on].present?
      @meals = @meals.where(eaten_on: params[:eaten_on])
    end
  end

  def show
    @meal = current_user.meals.find(params[:id])
  end

  def new
    @meal = current_user.meals.build
    @meal.meal_type = params[:meal_type]
    @meal.eaten_on = params[:eaten_on]
  end

  def create
    @meal = current_user.meals.build(meal_params)
    if @meal.save
      redirect_to action: 'index', eaten_on: @meal.eaten_on
    else
      render :new
    end
  end

  def edit
    @meal = current_user.meals.find(params[:id])
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

  def set_empty_product
    @product = current_user.products.build
  end

  def meal_params
    params.require(:meal).permit(:name, :quantity, :calories, :category, :eaten_on, :meal_type, :product_id)
  end

end
