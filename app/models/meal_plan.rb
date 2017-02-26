class MealPlan < ApplicationRecord
  belongs_to :user
  has_many :meals, -> { order(:date) }, inverse_of: :meal_plan

  accepts_nested_attributes_for :meals

  validates :start_date, presence: true
  validates :user, presence: true

  def build_meals
    recipes = Recipe.all
    recipe_ids = recipes.pluck(:id)

    (start_date..(start_date + 6)).each do |date|
      unused_recipes = recipe_ids - meals.map(&:recipe_id)

      available_recipes = unused_recipes.empty? ? recipe_ids : unused_recipes

      meals.build(date: date, recipe_id: available_recipes.sample)
    end
  end

  def to_s
    "#{start_date} - #{start_date + 6}"
  end
end
