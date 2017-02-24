class Recipe < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :instructions, presence: true
  validates :ingredients, presence: true
  validates :user, presence: true
end
