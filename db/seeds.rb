# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

8.times do |num|
	user = User.find_or_create_by(email: "test#{num}@test.com") do |user|
			user.password = "asdfasdf"
		end
	player = Player.create(user: user)
	team = player.teams.create(name: "team#{num}")

end

p "8 players created"


p "8 teams created"

40.times do 
	teams = Team.limit(2).order("RANDOM()")
	game = Game.find_or_create_by(game_type: 0, winner_id: teams.first.id, game_time: Time.now)
	game.teams << teams.first
	game.teams << teams.last
end

p "40 games created"
