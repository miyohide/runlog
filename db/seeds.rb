# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

YAML.load_file(Rails.root.join("db", "seeds", "nike_run_logs.yml")).each do |run_log|
  Runrecord.create(runned_at: run_log[:start_time],
                   distance:  run_log[:distance].to_f.round(3),
                   run_time:  run_log[:duration][0..-5])  # 最後のコンマ秒数は削除
end

