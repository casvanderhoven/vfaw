class User < ApplicationRecord
  include Clearance::User

  has_many :recipes
  has_many :meal_plans
  
  def recipe_options
    all_recipes = Recipe.all
    all_recipes.map do |recipe|
      [recipe.name, recipe.id]
    end
  end
end
