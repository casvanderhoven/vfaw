class AddMealtypeToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :mealtype, :string
  end
end
