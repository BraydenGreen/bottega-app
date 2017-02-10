class Team < ApplicationRecord
  has_many :team_players
  has_many :players, through: :team_players
  has_many :game_teams
  has_many :games, through: :game_teams
end
