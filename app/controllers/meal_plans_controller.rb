class MealPlansController < ApplicationController
  before_action :require_login

  def index
    @current_meal_plan = current_user.meal_plans.current_meal_plan
    @todays_meals = @current_meal_plan.meals.for_today
    @meals_after_today = @current_meal_plan.meals.after_today
    @meal_plans = current_user.meal_plans.all
  end

  def new
    @meal_plan = current_user.meal_plans.build
  end

  def create
    @meal_plan = current_user.meal_plans.build(meal_plan_params)
    @meal_plan.build_meals

    if @meal_plan.save
      flash[:success] = "You're all set!"
      redirect_to meal_plan_path(@meal_plan)
    else
      @errors = @meal_plan.errors.full_messages
      render :new
    end
  end

  def edit
    @meal_plan = current_user.meal_plans.find(params[:id])
  end

  def update
    @meal_plan = current_user.meal_plans.find(params[:id])

    if @meal_plan.update_attributes(meal_plan_params)
      flash[:success] = "Meal plan updated!"
      redirect_to meal_plan_path(@meal_plan)
    else
      @errors = @meal_plan.errors.full_messages
      render :edit
    end
  end

  def show
    redirect_to meal_plans_path
  end

  def destroy
    @meal_plan = current_user.meal_plans.find(params[:id])
    @meal_plan.destroy
    flash[:alert] = "Meal plan deleted!"
    redirect_to meal_plans_path
  end

  private

  def meal_plan_params
    params.require(:meal_plan).permit(:start_date, meals_attributes: [ :id, :date, :recipe_id ])
  end
end
