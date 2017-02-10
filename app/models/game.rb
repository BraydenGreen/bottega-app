class Game < ApplicationRecord
  has_many :game_teams
  has_many :teams, through: :game_teams
  has_many :players, through: :teams
  enum game_type: { ping_pong: 0 }
end
