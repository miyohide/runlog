# frozen_string_literal: true

module Types
  class SumByMonthType < Types::BaseObject
    field :year_and_month, String, null: false
    field :distance, Float
  end
end
