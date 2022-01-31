# frozen_string_literal: true

class Cocktail < ApplicationRecord

  belongs_to :category
  has_many :ingredients

  validates :name, presence: true, uniqueness: true

  scope :by_name, lambda { |name|
    words = name.split(' ')
    words = words.map.with_index { |w, i| i.zero? ? "#{w}%" : "% #{w}%" }
    where.like_and(name: words)
  }
end
