require "rails_helper"

RSpec.describe Recipe, :type => :model do
  describe "validity" do
    let(:recipe) { Recipe.new }
    before do
      recipe.valid?
    end

    it "requires a user" do
      expect(recipe.errors[:user]).to include("can't be blank")
    end

    it "requires a description" do
      expect(recipe.errors[:description]).to include("can't be blank")
    end

    it "requires a name" do
      expect(recipe.errors[:name]).to include("can't be blank")
    end

    xit "requires the name is unique for the same user" do
      existing_recipe = FactoryGirl.create(:recipe)
      recipe.name = existing_recipe.name
      recipe.user = existing_recipe.user

      recipe.errors[:name].should include("has already been taken")
    end
  end
end
