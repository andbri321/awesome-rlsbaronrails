# frozen_string_literal: true

require 'active_record'

module ActiveRecord
  module Like
    # gem activerecord_like
    module WhereChainExtensions
      def like_and(opts, *rest)
        opts = opts.reject { |_, v| v.is_a?(Array) && v.empty? }
        chain_node(Arel::Nodes::Matches, opts, *rest) do |nodes|
          Arel::Nodes::And.new(nodes)
        end
      end
    end
  end
end
