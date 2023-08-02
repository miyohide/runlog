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
      t.integer :total_lift
      t.integer :total_descent
      t.decimal :average_stride_length
      t.decimal :average_vertical_ratio
      t.decimal :average_vertical
      t.integer :average_contact_time
      t.string :average_gct_balance
      t.integer :average_power
      t.integer :max_power
      t.decimal :grid
      t.decimal :flow
      t.integer :average_swolf
      t.integer :average_stalk_rate
      t.integer :number_of_reps
      t.string :dive_time
      t.decimal :lowest_temp
      t.string :surface_rest
      t.string :decompression
      t.string :best_lap_time
      t.integer :lap_count
      t.decimal :highest_temp
      t.integer :travel_time
      t.integer :elapsed_time
      t.integer :minimum_altitude
      t.integer :maximum_altitude
      t.string :place
      t.string :start_time

      t.timestamps
    end
  end
end
