class Recipe < ApplicationRecord
  belongs_to :user

  has_attached_file :image, default_url: "/images/missing.png"

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :instructions, presence: true
  validates :mealtype, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :user, presence: true
end
