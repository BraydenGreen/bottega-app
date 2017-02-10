require 'rails_helper'

RSpec.describe Team, type: :model do
  it { should have_many(:team_players) }
  it { should have_many(:players) }
  it { should have_many(:game_teams) }
  it { should have_many(:games) }

  it "can create a team" do
    team = Team.new

    expect(team).to be_an_instance_of Team
  end
end
