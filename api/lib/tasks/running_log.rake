require 'csv'

namespace :running_log do
  desc 'update running log data'
  task update: :environment do
    CSV.foreach('formated_logs.csv', headers: true) { |row|
      p row
    }
  end
end
