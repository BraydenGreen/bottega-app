class Game < ApplicationRecord
  has_many :game_teams
  has_many :teams, through: :game_teams
  has_many :players, through: :teams
  enum game_type: { ping_pong: 0 }

  attr_accessor :player1_name, :player2_name, :player1_score, :player2_score
end
