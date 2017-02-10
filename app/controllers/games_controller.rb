class GamesController < ApplicationController
  def index
    @teams = Team.all.includes(:games)
  end

  def new
    @game = Game.new

    @players = Player.all
  end

  def create
    @game = Game.new(game_params)
      
      team1 = Player.find(params[:game][:player1_name]).teams.create(name: "team1")
      team2 = Player.find(params[:game][:player2_name]).teams.create(name: "team2")

      @game.game_time = Time.now
      @game.save

      GameTeam.create(game: @game, team: team1, points: params[:game][:player1_score])
      GameTeam.create(game: @game, team: team2, points: params[:game][:player2_score])

    respond_to do |format|
      if @game.save
        format.html { redirect_to games_path, notice: 'YOUR GAME SUCKS.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def game_params
    params.require(:game).permit()
  end
end