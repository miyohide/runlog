# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_01_120241) do
  create_table "runlogs", force: :cascade do |t|
    t.date "running_date"
    t.decimal "distance"
    t.integer "kcal"
    t.integer "time"
    t.integer "average_heart_beat"
    t.integer "max_heart_beat"
    t.string "aerobic_te"
    t.integer "average_pitch"
    t.integer "high_pitch"
    t.integer "average_pace"
    t.integer "high_pace"
    t.integer "total_lift"
    t.integer "total_descent"
    t.decimal "average_stride_length"
    t.decimal "average_vertical_ratio"
    t.decimal "average_vertical"
    t.integer "average_contact_time"
    t.string "average_gct_balance"
    t.integer "average_power"
    t.integer "max_power"
    t.decimal "grid"
    t.decimal "flow"
    t.integer "average_swolf"
    t.integer "average_stalk_rate"
    t.integer "number_of_reps"
    t.string "dive_time"
    t.decimal "lowest_temp"
    t.string "surface_rest"
    t.string "decompression"
    t.string "best_lap_time"
    t.integer "lap_count"
    t.decimal "highest_temp"
    t.integer "travel_time"
    t.integer "elapsed_time"
    t.integer "minimum_altitude"
    t.integer "maximum_altitude"
    t.string "place"
    t.string "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
