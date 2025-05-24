class CreateRooms < ActiveRecord::Migration[8.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :code
      t.references :participant_1, index: true, null: true, foreign_key: { to_table: :users }
      t.references :participant_2, index: true, null: true, foreign_key: { to_table: :users }

      t.timestamps
    end
    add_index :rooms, :name, unique: true
  end
end
