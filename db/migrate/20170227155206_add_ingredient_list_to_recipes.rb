class AddIngredientListToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :ingredient_list, :text
  end
end
