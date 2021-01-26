require 'bundler'
Bundler.require

require_relative 'lib/player'
#require_relative 'lib/game'

#binding.pry

def version_1
	#Creates 2 players
	player_1 = Player.new("Josiane")
	player_2 = Player.new("Jose")
	
	#Show who are the player and their lifepoints
	puts "Voici l'etat de chaque joueur: "
	#Player.all
	player_1.show_state
	player_2.show_state

puts ""
	puts "Passons a la phase d'attaque"
	
	while player_1.life_points > 0 && player_2.life_points > 0  #loop until someone dies; that is life points equals 0
		player_1.attacks(player_2) #first player attacks first
		if player_2.life_points > 0 	# if the attacked player survives, attack back
			player_2.attacks(player_1)
		end
		#puts ""
		puts "Voici l'etat de nos joueurs : "	#shows the remaining life points 
		player_1.show_state
		player_2.show_state
		puts ""	
		 
	end

	puts ""
       	puts "Game Over" 
	if player_1.life_points == 0  #the player who has 0 life points is the loser
		puts "#{player_2.name} a gagne"
       	else
		puts "#{player_1.name} a gagne"
	end

end
	

def perform
	version_1
end

perform

