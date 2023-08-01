class CreateRunlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :runlogs do |t|
      t.date :running_date
      t.decimal :distance
      t.integer :kcal
      t.integer :time
      t.integer :average_heart_beat
      t.integer :max_heart_beat
      t.string :aerobic_te
      t.integer :average_pitch
      t.integer :high_pitch
      t.integer :average_pace
      t.integer :high_pace
      t.string :total
      t.string :lift
      t.string :total_descent
      t.string :average_stride_length
      t.string :average_vertical_ratio
      t.string :average_vertical
      t.string :average_contact_time
      t.string :average_gct_balance
      t.string :average_power
      t.string :max_power
      t.string :grid
      t.string :flow
      t.string :average_swolf
      t.string :average_stalk_rate
      t.string :number_of_reps
      t.string :dive_time
      t.string :lowest_temp
      t.string :surface_rest
      t.string :decompression
      t.string :best_lap_time
      t.string :lap_count
      t.string :highest_temp
      t.string :travel_time
      t.string :elapsed_time
      t.string :minimum_altitude
      t.string :maximum_altitude
      t.string :place
      t.string :start_time

      t.timestamps
    end
  end
end
