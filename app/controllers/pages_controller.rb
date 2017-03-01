class PagesController < ApplicationController
  include HighVoltage::StaticPage

  def show
    @latest_recipes = Recipe.order(id: :desc).limit(6)
    render template: current_page
  end

end
