# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { "category_#{rand(999_999)}@user.com" }

    trait :alcoholic_drink do
      name { 'alcoholic_drink' }
    end

    trait :non_alcoholic_drink do
      name { 'non_alcoholic_drink' }
    end

    factory :category_alcoholic_drink, traits: [:alcoholic_drink]
    factory :category_non_alcoholic_drink, traits: [:non_alcoholic_drink]
  end
end
