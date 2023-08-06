require 'csv'

namespace :running_log do
  desc 'update running log data'
  task update: :environment do
    CSV.foreach('formated_logs.csv', headers: true) { |row|
      Runlog.create(
        running_date: row['date'],
        distance: row['distance'],
        kcal: row['kcal'],
        time: row['time'],
        average_heart_beat: row['average heat beat'],
        max_heart_beat: row['max heat beat'],
        aerobic_te: row['aerobic te'],
        average_pitch: row['average pitch'],
        high_pitch: row['high pitch'],
        average_pace: row['average pace'],
        high_pace: row['high pace'],
        total_lift: row['total lift'],
        total_descent: row['total descent'],
        average_stride_length: row['average stride length'],
        average_vertical_ratio: row['average vertical ratio'],
        average_vertical: row['average vertical'],
        average_contact_time: row['average_contact_time'],
        average_gct_balance: row['average_gct_balance'],
        average_power: row['average_power'],
        max_power: row['max power'],
        grid: row['grid'],
        flow: row['flow'],
        average_swolf: row['average swolf'],
        average_stalk_rate: row['average stalk rate'],
        number_of_reps: row['number_of_reps'],
        dive_time: row['dive_time'],
        lowest_temp: row['lowest temp'],
        lap_count: row['lap count'],
        highest_temp: row['hightest_temp'],
        travel_time: row['travel time'],
        elapsed_time: row['elapsed time'],
        minimum_altitude: row['minimum altitude'],
        maximum_altitude: row['maximum altitude'],
        place: row['place'],
        start_time: row['start time']
      )
    }
  end
end
