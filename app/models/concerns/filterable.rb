# frozen_string_literal: true

module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(params, scope = all)
      return scope unless params

      scope = filter_by_name(scope, params)
      filter_by_ingredient(scope, params)
    end

    private

    def filter_by_name(scope, params)
      return scope unless params[:name]

      scope.by_name(params[:name])
    end

    def filter_by_ingredient(scope, params)
      return scope unless params[:ingredient]

      scope.by_ingredient_name(params[:ingredient])
    end
  end
end
