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

  	game_board
  	start_player1
  end

  def players
  	puts "Player 1: #{@player1}"
  	puts "Player 2: #{@player2}"
  end

  def game_board
    @rows.each do |r|
  	  puts r.each { |c| c }.join(" ")
  	end
  end

  def start_player1
  	puts "#{@player1}: Please enter a number for your X to go"
  	player1_input = gets.chomp
    validate_input(player1_input)
    @selected_numbers << player1_input

  	locate_player1_input(player1_input)
  end
  
  def start_player2	
  	puts "#{@player2}: Please enter a number for your O to go"
  	player2_input = gets.chomp
    validate_input2(player2_input)
    @selected_numbers << player2_input
    
  	locate_player2_input(player2_input)		
  end

  def valid_input?(num)
    return true if num.match(/^\d$/)

    false
  end

  def validate_input(num)
    if @selected_numbers.include?(num)
      puts "That number has already been chosen, please select again"
      game_board
      start_player1
    end
  end

  def validate_input2(num)
    if @selected_numbers.include?(num)
      puts "That number has already been chosen, please select again"
      game_board
      start_player2
    end
  end

  def locate_player1_input(num)
  	if valid_input?(num) == true
  		@rows.map!{|x| x.map{|y| y == num.to_i ? "X" : y}}
  		@wins.map!{|x| x.map{|y| y == num.to_i ? "X" : y}}

  		@rows.each do |r|
  	  		puts r.each { |c| c }.join(" ")
  		end
  	else
  		puts "Please select a digit between 1 and 9"
      game_board
  		start_player1
  	end

  	if win? == true
  		puts "Congratulations #{@player1}, you got 3 in a row!"
      play_again
  	else
  		tie_game?
  		start_player2
  	end	
  end

  def locate_player2_input(num)
  	if valid_input?(num) == true
  		@rows.map!{|x| x.map{|y| y == num.to_i ? "O" : y}}
  		@wins.map!{|x| x.map{|y| y == num.to_i ? "O" : y}}

  		@rows.each do |r|
  	  		puts r.each { |c| c }.join(" ")
  		end	
  	else
  		puts "Please select a digit between 1 and 9"
      game_board
  		start_player2
  	end	

  	if win2? == true
  		puts "Congratulations #{@player2}, you got 3 in a row!"
      play_again
  	else
  		tie_game?
  		start_player1
  	end	 	
  end

  def win?
  	@wins.each do |row|
  		return true if row.all? { |input| input == "X"}
  	end

  	false
  end

  def win2?
  	@wins.each do |row|
  		return true if row.all? { |input| input == "O"}
  	end

  	false
  end

  def tie_game?
  	@counter += 1
  	if @counter == 9 
  		puts "The game was a tie. Nicely played #{@player1} & #{@player2}!"
      play_again  
  	end

  	return true
  end

  def play_again
    puts "Would you like to play again? (Y / N)"
    user_response = gets.chomp.downcase

      if user_response == "y"
        Game.new("Nick", "Harry")
      elsif user_response == "n"
        puts "Okay, thanks for playing!"
        exit
      else
        puts "Please enter 'Y' or 'N'"
        play_again
      end
  end
end


x = Game.new("Nick", "Harry")
x



