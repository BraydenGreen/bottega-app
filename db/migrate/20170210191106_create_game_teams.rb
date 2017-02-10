class CreateGameTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :game_teams do |t|
      t.references :game, foreign_key: true
      t.references :team, foreign_key: true
      t.integer :points, default: 0, null: false

      t.timestamps
    end
  end
end
