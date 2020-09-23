class CreateRunlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :runlogs do |t|
      t.datetime :run_date
      t.decimal :distance

      t.timestamps
    end
  end
end
