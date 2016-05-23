class Game

  def initialize(player1, player2)
  	@player1 = player1
  	@player2 = player2
  	game_board
  	start
  end

  def players
  	puts "Player 1: #{@player1}"
  	puts "Player 2: #{@player2}"
  end

  def game_board(*)
    rows = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

    rows.each do |r|
  	  puts r.each { |c| c }.join(" ")
  	end
  end

  def start
  	puts "#{@player1}: Please enter a number for your X to go"
  	player1_input = gets.chomp
  	locate_player_input(player1_input)
  end

  def locate_player_input(num)
  	rows = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  	rows.map!{|x| x.map{|y| y == num.to_i ? 'X' : y}}
  	
  	rows.each do |r|
  	  puts r.each { |c| c }.join(" ")
  	end
  	
  	
  end

  def updated_game_board(num)
  	rows = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  	print num
  end
end


class Player
  
  def initialize(name)
  	@name = name
  end

  def name
  	@name
  end

  def choose_space(num)

  end

end



x = Game.new("Nick", "Harry")
x



