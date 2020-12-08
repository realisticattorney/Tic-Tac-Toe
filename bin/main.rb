
require './lib/game_logic.rb'
require "colorize"
p String.colors

available_moves = (1..9).to_a
available_moves_shown = available_moves

puts UserInterface.show_game_instructions
puts 'Chose the name of player_1'.light_red
name1 = gets.chomp.to_s
puts 'Chose the name of player_2'.light_blue
name2 = gets.chomp.to_s

UserInterface.new(name1, name2)
LogicGame.new(UserInterface.players)
puts Board.gameboard()
keep_playing = true
while  keep_playing == true
  p LogicGame.keep_playing()
 puts UserInterface.show_who_play
 puts UserInterface.choose()
 p LogicGame.game_play (gets.chomp.to_i)
 puts Board.gameboard()
end
puts UserInterface.show_win_game