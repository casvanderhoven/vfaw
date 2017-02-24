class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path, notice: "Deleted recipe: #{recipe.name}"
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to recipe_path(@recipe), flash: "Recipe created!"
    else
      @errors = @recipe.errors.full_messages
      render :new
    end
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :instructions)
  end
end
