require "Gol_Col/version"
require "GameOfLife"

module GolCol
  def start
    puts "[...The game stops after 100 iterations...]"
    print "Insert row length: "
    row = gets.chop.to_i
    print "Insert column length: "
    column = gets.chop.to_i
    board = Array.new(row){Array.new(column){ rand(0..1) } }
    play = GameOfLife.new(row, column)
    play.display_board(board)
    play.next_board(board)
  end
end

class Main
  def self.start_game
    include GolCol
  end
end
