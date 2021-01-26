require 'bundler'
Bundler.require

require_relative 'lib/player'
#require_relative 'lib/game'

def welcome
	puts "------------------------------------------------"
	puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
	puts "|Le but du jeu est d'être le dernier survivant !|"
	puts "-------------------------------------------------"
end

def version_2
	
	puts "Comment tu t'appelles ?"		
	print ">>"

	player = gets.chomp				#Gets user name
	

	user = HumanPlayer.new(player)			#Gets HumanPlayer
	player1 = Player.new("Josiane")			#Starts Bot1 
        player2 = Player.new("Jose")				#Starts bot2
	
puts ""
	
	#Describes players
	puts "Voici l'etat de chaque joueur: "
	user.show_state
	player1.show_state
	player2.show_state
	
puts ""
	puts "Passons a la phase d'attaque"
        
        while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)  #Loop until HumanPlayer dies or both bots die
			
			fight_menu(player1, player2)	#Shows menu
			next_move = gets.chomp.to_s	#Gets HumanPLayer choice
puts ""			
			case next_move			#Sets HumanPLayer choice in motion
				when "a"
					user.search_weapon		#Search for a better weapon method
				when "s"
					user.search_health_pack	#Search for a health pack
				when "0"
					puts "FIGHT !"	
					user.attacks(player1)		#HumanPlayer attacks Player1
					print ">>"
					player1.show_state
				when "1"
					puts "FIGHT !"
					user.attacks(player2)		#HumanPlayer attacks Player2
					print ">>"
					player2.show_state
				else
					puts "Cette commande n'existe pas ! Fait pas ta flippette et joue !"
				end
			puts ""
			if Player.players_life > 0 			#Check if bot players have life points
				puts "Les autres joueurs t'attaquent!"

puts ""							
				Player.all_players.each{|player| if player.life_points>0 && user.life_points>0 
				then player.attacks(user)end } 
				#Bot players will reattack if they are alive and if HumanPlayer still has life points
			else
				puts "Il n'y a plus de players en etat de combattre"
			end
			user.show_state
	end
	
	
	if 								#When you are dead, you lost
		user.life_points == 0
		puts "--------------------"
		puts "La partie est finie"
		puts "Loser ! Tu as perdu !"
		
	else    player1.life_points == 0 && player2.life_points == 0 	#When both bot players are dead , you won
		puts "--------------------"
		puts "La partie est finie"
		puts "BRAVO ! TU AS GAGNE !"
	end


end

def perform
	welcome
	version_2
end

def fight_menu(player1, player2)  			#Action menu lets player decide what to do next
	puts "Quelle action veux-tu effectuer ?"
	puts " "
	puts "a - chercher une meilleure arme"
	puts "s - chercher à se soigner "
	puts " "
	puts "attaquer un joueur en vue :"
	print "0 - "
	player1.show_state
	print "1 - "
        player2.show_state
	print ">>"
end

perform
