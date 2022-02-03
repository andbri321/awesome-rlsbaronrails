# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cocktail, type: :model do
  let(:valid_attributes) do
    FactoryBot.build(:cocktail).attributes.symbolize_keys
  end

  let(:cocktails) do
    Array.new(3) do
      Cocktail.create(FactoryBot.build(:cocktail).attributes)
    end
  end

  context 'when initialized' do
    subject(:cocktail) { Cocktail.new }

    it 'is a new cocktail' do
      expect(cocktail).to be_a_new(Cocktail)
    end
  end

  context 'when saved' do
    subject(:cocktail) { Cocktail.create(valid_attributes) }

    it 'is not a new cocktail' do
      expect(cocktail).not_to be_a_new(Cocktail)
    end
  end

  context 'when I create a list' do
    subject { Cocktail.all }

    it 'returns all cocktails in any order' do
      expect(subject).to match_array(cocktails)
    end
  end

  context 'associations' do
    it { should belong_to(:category) }
    it { should have_many(:ingredients) }
  end
end
