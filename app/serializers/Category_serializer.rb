class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at

  has_many :cocktails

  link(:self) { v1_user_url(object.id) }
  link(:cocktails) { v1_cocktail_path(object.id) }

  meta do
    {autor: 'Anderson'}
  end
end