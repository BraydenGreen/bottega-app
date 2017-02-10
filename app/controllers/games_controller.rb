class GamesController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    # team1 = Player.first.teams.create(name: "team1")
    # team2 = Player.second.teams.create(name: "team2")

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'YOUR GAME SUCKS.' }
      else
        format.html { render :new }
      end
    end
  end

  private
  def game_params
    params.require(:game).permit
  end
end
