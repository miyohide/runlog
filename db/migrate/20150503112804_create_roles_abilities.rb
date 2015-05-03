class CreateRolesAbilities < ActiveRecord::Migration
  def change
    create_table :roles_abilities do |t|
      t.integer :role_id
      t.integer :ability_id

      t.timestamps
    end
  end
end
