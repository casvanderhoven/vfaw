require "rails_helper"

describe Meal do
  describe "validity" do
    let(:meal) { Meal.new }

    before do
      meal.valid?
    end

    it "requires a date" do
      expect(meal.errors[:date]).to include("can't be blank")
    end

    it "requires a meal plan" do
      expect(meal.errors[:meal_plan]).to include("can't be blank")
    end

    it "requires a recipe" do
      expect(meal.errors[:recipe]).to include("can't be blank")
    end
  end
end
