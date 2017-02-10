class Player < ApplicationRecord
  belongs_to :user
  has_many :team_players
  has_many :teams, through: :team_players
  has_many :games, through: :teams

  validates_presence_of :username
end
