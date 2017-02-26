require "rails_helper"

describe MealPlan do
  describe "validity" do
    let(:meal_plan) { MealPlan.new }

    before do
      meal_plan.valid?
    end

    it "requires a start date" do
      expect(meal_plan.errors[:start_date]).to include("can't be blank")
    end

    it "requires a user" do
      expect(meal_plan.errors[:user]).to include("can't be blank")
    end
  end

  describe "generating a weekly plan" do
    let(:meal_plan) { build(:meal_plan) }

    before do
      7.times do
        create(:recipe, user: meal_plan.user)
      end
    end

    it "populates a meal for each date between start and 7 days later" do
      expect(meal_plan.meals.size).to eq(0)
      meal_plan.build_meals
      expect(meal_plan.meals.size).to eq(7)
    end

    it "builds valid meals" do
      meal_plan.build_meals

      expect(meal_plan.meals.all?(&:valid?)).to eq(true)
    end

    it "uses unique recipes" do
      meal_plan.build_meals

      unique_ids = meal_plan.meals.map(&:recipe_id).uniq
      expect(unique_ids.size).to eq(7)
    end
  end
end
