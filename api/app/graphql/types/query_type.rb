module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    field :runlogs, [Types::RunlogType], null: false
    def runlogs
      Runlog.order(running_date: :asc).all
    end
  end
end
