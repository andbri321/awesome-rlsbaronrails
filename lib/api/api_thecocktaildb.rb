# frozen_string_literal: true

# documentação https://www.thecocktaildb.com/api.php
class ApiThecocktaildb
  def initialize
    @client = Faraday
    @base_url = 'https://www.thecocktaildb.com/'
  end

  def list_cocktails
    response = @client.get(end_point_list_cocktails)

    cocktails = JSON.parse(response.body)['drinks']

    cocktails.map do |cocktail|
      get_hash cocktail
    end
  end

  private

  def end_point_list_cocktails
    "#{@base_url}api/json/v1/1/list.php?g=list"
  end

  def get_hash(cocktail)
    {
      id: nil,
      name: cocktail['strGlass'],
      category_id: nil,
      created_at: nil,
      updated_at: nil
    }
  end
end
