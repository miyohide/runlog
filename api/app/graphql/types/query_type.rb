module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    field :all_running_logs, [Types::AllRunningLogType], null: false
    def all_running_logs
      Runlog.order(running_date: :asc).all
    end

    field :sum_by_month, [Types::SumByMonthType], null: false
    def sum_by_month
      r = Runlog.group("STRFTIME('%Y%m', running_date)").sum("distance")
      r.map{ |item| { year_and_month: item[0], distance: item[1] }}
    end
  end
end
