class CreateGarminLogs < ActiveRecord::Migration
  def change
    create_table :garmin_logs do |t|

      t.timestamps
    end
  end
end
