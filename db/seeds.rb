# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

2.times do |num|
	count = User.count+1
	user = User.find_or_create_by(email: "test#{num+count}@test.com") do |user|
			user.password = "asdfasdf"
		end
	user = Player.create(user: user, username: "bobevans#{num+count}")

end

p "2 players created"

team1 = Player.first.teams.create(name: "team1")
team2 = Player.second.teams.create(name: "team2")

p "2 teams created"

game = Game.create(game_time: Time.now)

GameTeam.create(game: game, team: team1)
GameTeam.create(game: game, team: team2)

p "1 game created"
