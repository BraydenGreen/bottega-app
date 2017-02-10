class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :game_type, default: 0, null: false
      t.datetime :game_time
      t.integer :winner_id

      t.timestamps
    end
  end
end
