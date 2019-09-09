class Recipe < ApplicationRecord
  validates :name, :recipe_type, :difficulty, :cook_time, :ingredients, presence: true
end
