class CreateShoes < ActiveRecord::Migration[6.0]
  def change
    create_table :shoes do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :shoes, :name, unique: true
  end
end
