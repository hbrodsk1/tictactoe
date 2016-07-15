require "tictactoe"

describe Game do
	let(:game) { Game.new("Harry", "Nick") }
	describe "#players" do
			it "displays player names" do
				expect(game.players).to eq("Player 1: Harry\nPlayer 2: Nick")
			end
	end

	describe "#start" do
		context "X player's turns" do
			it "prints proper messege" do
				expect(STDOUT).to receive(:puts).with("Harry: Please enter a number for your X to go")
				expect(game).to receive(:get_input)
				game.start("X")
			end
		end

		context "O player's turns" do
			it "prints proper messege" do
				expect(STDOUT).to receive(:puts).with("Nick: Please enter a number for your O to go")
				expect(game).to receive(:get_input)
				game.start("O")
			end
		end
	end

	describe "#get_input" do 
		context "Player inputs a guess" do
			it "gets input and calls next method" do
				allow(STDIN).to receive(:gets).and_return("5")
				expect(game).to receive(:locate_player_input)
				game.get_input("X")
			end
		end
	end

	describe "#valid_input?" do
		context "valud input is given" do
			it "returns true" do
				expect(game.valid_input?("4")).to eq(true)
			end
		end

		context "invald input is given" do
			it "returns false" do
				expect(game.valid_input?("a")).to eq(false)
			end
		end
	end

	describe "#increment_counter"
		context "call #increment_counter" do
			it "increments each time it is called" do
				game.instance_variable_set(:@counter, 0)
				4.times { game.increment_counter }
				expect(game.instance_variable_get(:@counter)).to eq(4)	
			end
		end

		context "after fewer than 9 moves" do
    		it "does not call tie_game" do
      			expect(game).not_to receive(:tie_game)
      			8.times { game.increment_counter }
    		end
  		end

  		context "after 9 moves" do
    		it "calls tie_game" do
      			expect(game).to receive(:tie_game)
      			9.times { game.increment_counter }
    		end
  		end

  	describe "win?" do
  		context "horizontal win" do
  			it "returns true" do
  				game.instance_variable_set(:@wins, [["X", "X", "X"], [4, 5, 6], [7, 8, 9], 
  			[1, 4, 7], [2, 5, 8], [3, 6, 9],
  			[1, 5, 9], [3, 5, 7]])
  				expect(game.win?("X")).to eq(true)
  			end
  		end

  		context "vertical win" do
  			it "returns true" do
  				game.instance_variable_set(:@wins, [[1, 2, 3], [4, 5, 6], [7, 8, 9], 
  			[1, 4, 7], ["X", "X", "X"], [3, 6, 9],
  			[1, 5, 9], [3, 5, 7]])
  				expect(game.win?("X")).to eq(true)
  			end
  		end

  		context "diagonal win" do
  			it "returns true" do
  				game.instance_variable_set(:@wins, [[1, 2, 3], [4, 5, 6], [7, 8, 9], 
  			[1, 4, 7], [2, 5, 8], ["X", "X", "X"],
  			[1, 5, 9], [3, 5, 7]])
  				expect(game.win?("X")).to eq(true)
  			end
  		end
  	end

  	


























end
