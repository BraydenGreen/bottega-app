require 'rails_helper'

RSpec.describe Game, type: :model do
  it { should have_many(:game_teams) }
  it { should have_many(:teams) }
end
