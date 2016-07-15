class Game

  def initialize(player1, player2)
  	@player1 = player1
  	@player2 = player2
  	@rows = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

  	@wins = [1, 2, 3], [4, 5, 6], [7, 8, 9], 
  			[1, 4, 7], [2, 5, 8], [3, 6, 9],
  			[1, 5, 9], [3, 5, 7]

    @selected_numbers = []
  	@counter = 0
  end

  def players
  	return "Player 1: #{@player1}\nPlayer 2: #{@player2}"
  end

  def game_board
    @rows.each do |r|
  	  puts r.each { |c| c }.join(" ")
  	end
  end

  def start(token)
    if token == "X"
      puts "#{@player1}: Please enter a number for your X to go"
    elsif token == "O"
      puts "#{@player2}: Please enter a number for your O to go"
    end

    get_input(token)
  end

  def get_input(token)
     player_input = STDIN.gets.chomp
  	 locate_player_input(token, player_input)
  end
  
  def valid_input?(num)
    return true if num.match(/^\d$/)

    false
  end

  def validate_input(token, num)
    if @selected_numbers.include?(num)
      puts "That number has already been chosen, please select again"
      game_board
      start(token)
    end
  end

  def increment_counter
    @counter += 1

    if @counter == 9
      tie_game
    end
  end

  def locate_player_input(token, number)
  	if valid_input?(number) == true
      validate_input(token, number)
      increment_counter
      @selected_numbers << number

  		@rows.map!{|x| x.map{|y| y == number.to_i ? token : y}}
  		@wins.map!{|x| x.map{|y| y == number.to_i ? token : y}}

  		@rows.each do |r|
  	  		puts r.each { |c| c }.join(" ")
  		end
  	else
  		puts "Please select a digit between 1 and 9"
      game_board
  		start(token)
  	end

  	if win?(token) == true
      if token == "X"
  		  puts "Congratulations #{@player1}, you got 3 in a row!"
      elsif token == "O"
        puts "Congratulations #{@player2}, you got 3 in a row!" 
      end   
      play_again
    end

    if token == "X"
      token = "O"
    elsif token == "O"
      token = "X"
    end

    start(token)	
  end

  def win?(token)
  	@wins.each do |row|
  		return true if row.all? { |input| input == token}
  	end

  	false
  end

  def tie_game
  		puts "The game was a tie. Nicely played #{@player1} & #{@player2}!"
      play_again  
  end

  def play_again
    puts "Would you like to play again? (Y / N)"
    user_response = STDIN.gets.chomp.downcase

      if user_response == "y"
        new_game = Game.new("#{@player1}", "#{@player2}")
        new_game.game_board
        new_game.start("X")
      elsif user_response == "n"
        puts "Okay, thanks for playing!"
        exit
      else
        puts "Please enter 'Y' or 'N'"
        play_again
      end
  end
end


#Game.new("Nick", "Harry")
#x.game_board
#x.start("X")

if __FILE__ == $0
  game = Game.new("Harry", "Nick") ; game.game_board ; game.start("X") 
end



