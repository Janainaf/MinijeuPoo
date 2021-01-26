

class Player   
	attr_accessor :name, :life_points  	#Each player has a name and life points: these variables can change
	@@life_sum = 0				
	@@all_players = Array.new			#Gathers all bot players for version 3.0

	def initialize(new_name)
		@name = new_name
		
		if self.class == Player		#Player for the first game app.rb 
			@life_points=10
			@@all_players << self	        #adds new players if necessary 
		end

	end
	
	def self.all
		@@all_players.each do |player|	#Shows name and life points for each player
			puts "player : #{player.name}"
			puts "life : #{player.life_points}"
		end
	end

	def self.all_players			#All players in the game
		return @@all_players
			
	end

	def show_state				#Shows player life points and if 0 player is dead
		if @life_points > 0
			puts "#{@name} a #{@life_points} points de vie"
		else
			puts "#{@name} est mort"
		end
	end

	def gets_damage(damage,attacked_player)		#Substracts life points due attack 
		attacked_player.life_points= attacked_player.life_points-damage
		if attacked_player.life_points<=0 	#if player life points is equal or less than 0, dead 
		end
	end
	
	def attacks(attacked_player)			#Attack a player 
		puts "#{name} attaque #{attacked_player.name}"
		damages = compute_damage		#Registers amount of damage 
		gets_damage(damages,attacked_player)	#Calls gets_damage function and applies to players life points
		puts "Il lui inflige #{damages} points de dommages"
		puts ""
	end
	
	def self.players_life				#Checks if there are players left alive 
		@@life_sum = 0
		@@all_players.each{|user| @@life_sum += user.life_points}
		return @@life_sum
	end

	private
	
	def compute_damage				#Method random number between 1-6 
		return rand(1..6)
	end
end


class HumanPlayer < Player				#New class but inherents Player 
	attr_accessor :weapon_level			#Adding some weapons
	
	def initialize(name)				
		@weapon_level = 1			# Variabe only for the HumanPlayer class
		@life_points = 100			# Different life points	
	
		super(name)
	end

	def show_state					#Shows name, life points and weapon Need to change to show it of each player
		puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
	end 
	
	def search_weapon				#Change human weapon
		new_weapon_level = rand(1..6)		#Increases weapon level randomly 
		puts "Tu as une  arme de niveau #{@weapon_level}"
		if @weapon_level < new_weapon_level	#Seeks if the new weapon is better than the current one
			@weapon_level = new_weapon_level
			puts "Tu as trouve une arme de niveau #{@weapon_level}"
			puts "Youhou! elle est meilleure que ton arme actuelle : tu la prends."
		else
			puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
		end
	end

	def search_health_pack				#Search for a healthpack method
		puts new_life = rand(1..6)		#Randomly sets a healthpack unit
		
		if new_life.between?(2,5)		#If the number is between 2 and 5, adds 50 to lifepoints
			puts "Bravo, tu as trouvé un pack de +50 points de vie !"
			if (@life_points + 50) > 100	#HumanPlayer life points cant surpass 100
			       @life_points = 100
			else
		 		@life_points = @life_points + 50
			end		
			puts "Tu as #{@life_points} points de vie maintenant."

		elsif new_life == 6
			puts "Waow, tu as trouvé un pack de +80 points de vie !"
			if (@life_points + 80) > 100
                               @life_points = 100
                        else
                                @life_points = @life_points + 80
                        end
			puts "Tu as #{@life_points} points de vie maintenant."

		else
			puts "Tu n'as rien trouvé... "
		end
	end

	private

	def compute_damage					#Method to set a random number
		return	rand(1..6) * @weapon_level
	end
end
