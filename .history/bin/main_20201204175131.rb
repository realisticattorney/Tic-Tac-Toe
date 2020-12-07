# rubocop: disable Metrics/BlockNesting

available_moves = (1..9).to_a
available_moves_shown = available_moves
rows_cols = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
chosen_p1 = []
chosen_p2 = []
win = false

def gameboard(available_moves_shown)
  board_line = '+---+---+---+'
  puts board_line
  puts "| #{available_moves_shown[0]} | #{available_moves_shown[1]} | #{available_moves_shown[2]} |"
  puts board_line
  puts "| #{available_moves_shown[3]} | #{available_moves_shown[4]} | #{available_moves_shown[5]} |"
  puts board_line
  puts "| #{available_moves_shown[6]} | #{available_moves_shown[7]} | #{available_moves_shown[8]} |"
  puts board_line
end

gameboard(available_moves_shown)
p available_moves
turns_available = 9

while win == false && !turns_available.zero?
  if turns_available.odd?
    puts "Ready Player One: \n (moves available: #{available_moves}"
  else
    puts "Ready Player Two: \n (moves available: #{available_moves}"
  end
  turn = gets.chomp.to_i
  map_available = available_moves.reject { |a| a.to_i == turn.to_i }
  p turn
  if available_moves.length == map_available.length || turn.zero?
    puts 'Select an option from the available as shown'
    gameboard(available_moves_shown)
    next
  else
    chosen = available_moves - map_available
    available_moves -= chosen
    if turns_available.odd?
      chosen_p1 << chosen[-1]
      available_moves_shown[chosen[-1] - 1] = 'X'
    else
      chosen_p2 << chosen[-1]
      available_moves_shown[chosen[-1] - 1] = 'O'
    end

    gameboard(available_moves_shown)
    turns_available -= 1
    if chosen_p1.size >= 3

      rows_cols.each do |n_row|
        count1 = 0
        count2 = 0
        n_row.each do |n|
          if chosen_p1.include?(n)
            count1 += 1
          elsif chosen_p2.include?(n)
            count2 += 1
          else
            count1 = 0
            count2 = 0
          end
          if count1 > 2
            p 'win'
            win = true
          elsif count2 > 2
            p ' player 2 win'
            win = true
          end
        end
      end

    end
  end
end

p "It's a draw" if win == false

# rubocop: enable Metrics/BlockNesting