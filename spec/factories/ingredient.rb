# frozen_string_literal: true

FactoryBot.define do
  factory :ingredient do
    name { "ingredient_#{rand(999_999)}@user.com" }
    cocktail { FactoryBot.create(:cocktail) }
  end
end
