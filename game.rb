require_relative './player'
require_relative './question'

class Game 
  def initialize

    # create 2 players
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @players = [@player1, @player2].shuffle 


  end

  def status(current_player)
    puts "P1: #{@player1.hp}/3 vs P2: #{@player2.hp}/3"
  end

  def good_answer(current_player)
    puts "#{current_player.name}: YES! You are correct!"
    puts status(current_player)
  end

  def bad_answer(current_player) 
    puts "#{current_player.name}: Seriously? NO!"
    current_player.hp -= 1
    puts status(current_player)
  end
  
  def play 
    current_player = @players.first
    
    while (@player1.hp > 0 && @player2.hp > 0) do 
      question = Question.new()
      question.ask(current_player.name)
    print "> "
  choice = ($stdin.gets.chomp).to_i

  if question.compare(choice)
     good_answer(current_player) 
  else
    bad_answer(current_player)
    end
    if current_player == @players.first
      current_player = @players[1]
    else
      current_player = @players[0]
    end
    if @player1.hp == 0 
      puts "Players 2 wins with a score of #{@player2.hp}/3"
    elsif @player2.hp == 0
      puts "Players 1 wins with a score of #{@player1.hp}/3"
    else
    puts "----- NEW TURN -----"
    end
  end

  end
end

  