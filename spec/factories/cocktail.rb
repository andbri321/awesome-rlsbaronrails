# frozen_string_literal: true

FactoryBot.define do
  factory :cocktail do
    name { "cocktail_#{rand(99_999)}@user.com" }
    category { FactoryBot.create(:category) }

    factory :cocktail_alcoholic_drink, traits: [:alcoholic_drink]
    factory :cocktail_non_alcoholic_drink, traits: [:non_alcoholic_drink]
    factory :cocktail_with_ingredients, traits: [:with_ingredients]

    trait :alcoholic_drink do
      category { FactoryBot.create(:category_alcoholic_drink) }
    end

    trait :non_alcoholic_drink do
      category { FactoryBot.create(:category_non_alcoholic_drink) }
    end

    trait :with_ingredients do
      after(:create) do |cocktail|
        FactoryBot.create_list(:ingredient, 2, cocktail: cocktail)
      end
    end
  end
end
