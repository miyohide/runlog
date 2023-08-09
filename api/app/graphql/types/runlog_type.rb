# frozen_string_literal: true

module Types
  class RunlogType < Types::BaseObject
    field :id, ID, null: false
    field :running_date, GraphQL::Types::ISO8601Date
    field :distance, Float
    field :kcal, Integer
    field :time, Integer
    field :average_heart_beat, Integer
    field :max_heart_beat, Integer
    field :aerobic_te, String
    field :average_pitch, Integer
    field :high_pitch, Integer
    field :average_pace, Integer
    field :high_pace, Integer
    field :total_lift, Integer
    field :total_descent, Integer
    field :average_stride_length, Float
    field :average_vertical_ratio, Float
    field :average_vertical, Float
    field :average_contact_time, Integer
    field :average_gct_balance, String
    field :average_power, Integer
    field :max_power, Integer
    field :grid, Float
    field :flow, Float
    field :average_swolf, Integer
    field :average_stalk_rate, Integer
    field :number_of_reps, Integer
    field :dive_time, String
    field :lowest_temp, Float
    field :surface_rest, String
    field :decompression, String
    field :best_lap_time, String
    field :lap_count, Integer
    field :highest_temp, Float
    field :travel_time, Integer
    field :elapsed_time, Integer
    field :minimum_altitude, Integer
    field :maximum_altitude, Integer
    field :place, String
    field :start_time, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
