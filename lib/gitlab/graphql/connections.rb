# frozen_string_literal: true

module Gitlab
  module Graphql
    module Connections
      def self.use(_schema)
        GraphQL::Relay::BaseConnection.register_connection_implementation(
          ActiveRecord::Relation,
          Gitlab::Graphql::Connections::Keyset::Connection
        )
        GraphQL::Relay::BaseConnection.register_connection_implementation(
          Gitlab::Graphql::FilterableArray,
          Gitlab::Graphql::Connections::FilterableArrayConnection
        )
      end
    end
  end
end
