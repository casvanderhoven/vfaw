class Recipe < ApplicationRecord
  include  Filterable

  belongs_to :user

  scope :with_mealtype, -> (mealtypes) { where mealtype: [mealtypes] }


  has_attached_file :image, default_url: "http://placehold.it/800x800"

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :instructions, presence: true
  validates :mealtype, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :user, presence: true
end
