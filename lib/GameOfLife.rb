class GameOfLife
  attr_accessor :row
  attr_accessor :column
  attr_accessor :last_row
  attr_accessor :last_column

  def initialize(row,column)
    @row = row
    @column = column
    @last_row = row.to_i-1
    @last_column = column.to_i-1
  end
  def display_board(board)
    board.each.with_index do |row, i|
      row.each.with_index do |cell, j|
        print  board[i][j] == 1 ? "0" : " "
      end
      puts
    end
  end
  def get_neighbors(board, row, column)
    row_max = [row - 1, 0].max
    row_min = [row + 1, @last_row.to_i].min
    column_max = [column - 1, 0].max
    column_min = [column + 1, @last_column].min
    array_neighbors = []
    (row_max..row_min).each do |i|
      (column_max..column_min).each do |j|
        unless i == row and j == column
          array_neighbors << board[i][j]
        end
      end
    end
    return array_neighbors.inject(:+)
  end
  def next_board(board)
    i = 1
    while i <= 100
      temp_board = Array.new(@row){Array.new(@column){ 0 } }
      system("clear")
      board.each.with_index do |row, i|
        row.each.with_index do |cell, j|
          neighbors = get_neighbors(board,i,j)
          if board[i][j] == 1 and neighbors < 2
            temp_board[i][j] = 0
          elsif board[i][j] == 1 and neighbors > 3
            temp_board[i][j] = 0
          elsif board[i][j] == 1 and neighbors == 3 || neighbors == 2
            temp_board[i][j] = 1
          elsif board[i][j] == 0 and neighbors == 3
            temp_board[i][j] = 1
          end
        end
      end
      board = temp_board
      display_board(board)
      puts "Iterations: #{i}"
      sleep(0.2)
      i+=1
    end
  end
end
