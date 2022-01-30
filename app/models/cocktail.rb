# frozen_string_literal: true

class Cocktail < ApplicationRecord
  belongs_to :category
  has_many :ingredients
end
