class CocktailSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at

  belongs_to :category
  belongs_to :user do
    link(:user) { v1_user_url(object.id) }
  end
  has_many :ingredients

  link(:self) { v1_cocktail_url(object.id) }


  meta do
    {autor: 'Anderson'}
  end
end
