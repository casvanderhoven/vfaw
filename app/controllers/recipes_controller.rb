class RecipesController < ApplicationController
  load_and_authorize_resource

  def index
    @recipes = Recipe.filter(params.slice(:with_mealtype))
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    recipe = current_user.recipes.find(params[:id])
    recipe.destroy
    redirect_to recipes_path, notice: "Deleted recipe: #{recipe.name}"
  end

  def new
    @recipe = current_user.recipes.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save

      redirect_to recipe_path(@recipe), notice: "Recipe created!"
    else
      @errors = @recipe.errors.full_messages
      render :new
    end
  end

  def edit
    @recipe = current_user.recipes.find(params[:id])
  end

  def update
    @recipe = current_user.recipes.find(params[:id])

    if @recipe.update_attributes(recipe_params)
      redirect_to recipe_path(@recipe), notice: "Recipe updated!"
    else
      @errors = @recipe.errors.full_messages
      render :edit
    end
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :instructions, :mealtype, :image)
  end
end
