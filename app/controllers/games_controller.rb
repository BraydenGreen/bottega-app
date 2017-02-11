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

      player1_score = params[:game][:player1_score]
      player2_score = params[:game][:player2_score]


      GameTeam.create(game: @game, team: team1, points: player1_score)
      GameTeam.create(game: @game, team: team2, points: player2_score)



    if player1_score > player2_score
      @game.winner = team1
    else
      @game.winner = team2
    end


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