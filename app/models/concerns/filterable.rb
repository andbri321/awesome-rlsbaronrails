# frozen_string_literal: true

module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(params)
      scope = all
      filter_by_name(scope, params)
    end

    private

    def filter_by_name(scope, params)
      return scope unless params[:name]

      scope.by_name(params[:name])
    end
  end
end
