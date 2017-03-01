class RecipesController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => [:index, :show]

  def index
    @recipes = Recipe.all
  end

  def with_mealtype
    mealtypes = params[:with_mealtype]
    @filtered_recipes = Recipe.with_mealtype(mealtypes)
    respond_to do |format|
      format.js
    end
  end


  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredient_list.split(', ')
    @instruction_array = @recipe.instructions.split('/')
  end

  def destroy
    recipe = current_user.recipes.find(params[:id])
    recipe.destroy
    redirect_to recipes_path, flash[:notice] = "Deleted recipe: #{recipe.name}"
  end

  def new
    @recipe = current_user.recipes.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save

      redirect_to recipe_path(@recipe), flash[:succes] = "Recipe created!"
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
      redirect_to recipe_path(@recipe), flash[:success] = "Recipe updated!"
    else
      @errors = @recipe.errors.full_messages
      render :edit
    end
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :ingredient_list, :instructions, :mealtype, :image)
  end
end
