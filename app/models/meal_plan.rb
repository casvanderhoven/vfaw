class MealPlan < ApplicationRecord
  belongs_to :user
  has_many :meals, -> { order(:date) }, inverse_of: :meal_plan, dependent: :destroy

  default_scope { order('created_at DESC') }

  accepts_nested_attributes_for :meals

  validates :start_date, presence: true
  validates :user, presence: true

  scope :current_meal_plan, lambda { where("start_date <= ?", Date.tomorrow).first }

  def build_meals
    recipes = Recipe.all
    breakfast_ids  = recipes.where(:mealtype => "breakfast").pluck(:id)
    lunch_ids  = recipes.where(:mealtype => "lunch").pluck(:id)
    dinner_ids  = recipes.where(:mealtype => "dinner").pluck(:id)

    (start_date..(start_date + 6)).each do |date|
      unused_breakfast = breakfast_ids - meals.map(&:recipe_id)
      unused_lunch = lunch_ids - meals.map(&:recipe_id)
      unused_dinner = dinner_ids - meals.map(&:recipe_id)

      available_breakfast = unused_breakfast.empty? ? breakfast_ids : unused_breakfast
      available_lunch = unused_lunch.empty? ? lunch_ids : unused_lunch
      available_dinner = unused_dinner.empty? ? dinner_ids : unused_dinner

      meals.build(date: date, recipe_id: available_breakfast.sample)
      meals.build(date: date, recipe_id: available_lunch.sample)
      meals.build(date: date, recipe_id: available_dinner.sample)
    end
  end

  def to_s
    "#{start_date} - #{start_date + 6}"
  end

  def self.expired?(meal_plan)
    if meal_plan.start_date + 6 < Date.today
      return true
    else
      return false
    end
  end
end
