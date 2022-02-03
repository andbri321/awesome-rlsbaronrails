# frozen_string_literal: true

class Cocktail < ApplicationRecord
  paginates_per 5
  include Filterable

  belongs_to :category
  belongs_to :user, optional: true
  has_many :ingredients

  validates :name, presence: true, uniqueness: true

  scope :by_name, lambda { |name|
    words = name.split(' ')
    words = words.map.with_index { |w, i| i.zero? ? "#{w}%" : "% #{w}%" }
    where.like_and(name: words)
  }

  scope :by_ingredient_name, lambda { |name|
    joins(:ingredients).where('lower(ingredients.name) LIKE ?', "%#{name.downcase}%").distinct
  }
end
