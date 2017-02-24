class AddIngredientsOnRecipes < ActiveRecord::Migration[5.0]
  def change
    enable_extension "hstore"
    add_column :recipes, :ingredients, :hstore
    add_index :recipes, :ingredients, using: :gist
  end
end
