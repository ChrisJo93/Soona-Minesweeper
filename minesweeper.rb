class Board
    def self.transform(board)
        
        raise ArgumentError unless boardValid?(board)
        

        board.each_with_index do |row, x|
            row.chars.each_with_index do |column, y|
                
                if column == ' '
                    
                    count = 0
                    
                    top = [board, (x - 1), y]
                    bottom = [board, (x + 1), y]
                    left = [board, x, (y - 1)]
                    right = [board, x,( y + 1)]

                    topLeft = [board, (x - 1), (y - 1)]
                    topRight = [board, (x - 1), (y + 1)]
                    bottomLeft = [board, (x + 1), (y - 1)]
                    bottomRight = [board, (x + 1), (y + 1)]

                    # x at 0 or x.size is alwayd boundary
                    # y at 0 or row size is always boundary
                    if x > 0
                        count += 1 if y > 0 && mine?(topLeft)
                        count += 1 if mine?(left)
                        count += 1 if y < x.size && mine?(topRight)
                        count += 1 if mine?(top)
                    end
                    
                    
                    if x < board.size - 1 
                        count += 1 if y < x.size && mine?(bottomRight)
                        count += 1 if y < x.size - 1 && mine?(right)
                        count += 1 if y > 0 && mine?(bottomLeft)
                        count += 1 if mine?(bottom)
                    end
                    board[x][y] = count.to_s if count > 0
                end
            end
        end
        board
        end
    end

    def mine?(coordinate)
        coordinate[0][coordinate[1]][coordinate[2]] == "*"
    end

    def boardValid?(board)
        board.each_with_index do |row, index|
           return false if row.size != board.first.size
    end
   
end

Board.transform(['+-+', '| |', '|*  |', '|  |', '+-+'])