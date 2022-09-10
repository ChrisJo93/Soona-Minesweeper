# build coordinate array by interating over input
# iterate over each each row assigning x axis value
# iterate over rows again with row[x] counting y axis
# if * any adjacents at the * coordinate defined as [x1 - x2] > 1 || [y1 - y2] >1 incrememt that coordinate by 1

# might try # array.repeated_permutation(int).map{|i,j| "#{i}-#{j}"} to build coordinates
# might try using next if row in item isn't white space, int, or * to avoid border
class Board
    def self.transform(board)
      
    puts board
      workBoard = removeBorder(board)
      workBoard.each_with_index do |row, x|
      
        row.split('').each_with_index do |column, y|
  
          if (workBoard[x][y] == "*")
            
            right = workBoard[x + 1][y].to_i
            left = workBoard[x - 1][y].to_i
            up = workBoard[x][y + 1].to_i
            down = workBoard[x][y - 1].to_i
            
            workBoard[x + 1][y] = (right += 1).to_s
            workBoard[x - 1][y] = (left += 1).to_s
            workBoard[x][y + 1] = (up += 1).to_s
            workBoard[x][y - 1] = (down += 1).to_s
            
    
          end
        end
        
        end
          puts board
  end
      end
  
  def removeBorder(board)
      board.shift
      board.pop
      board.each do |spaces|
          spaces.slice!(0)
          spaces.chop!
  
      end
  end
  
  Board.transform(['+------+', '| *  * |', '|  *   |', '|    * |', '|   * *|', '| *  * |', '|      |', '+------+'])
  