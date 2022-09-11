# # # build coordinate array by interating over input
# # # iterate over each each row assigning x axis value
# # # iterate over rows again with row[x] counting y axis
# # # if * any adjacents at the * coordinate defined as [x1 - x2] > 1 || [y1 - y2] >1 incrememt that coordinate by 1

# # # might try # array.repeated_permutation(int).map{|i,j| "#{i}-#{j}"} to build coordinates
# # # might try using next if row in item isn't white space, int, or * to avoid border

# class Board
#     def self.transform(board)
      
#       # mineCoordinates = []
#     # puts board
#       done = board.dup
#       # workBoard = removeBorder(board)
#       # workBoard.each_with_index do |row, x|
#         board.each_with_index do |row, x|
#           row.chars.each_with_index do |column, y|
#             if column == " "
    
#               count = 0;
#               if x > 0
#                 # mine northwest of y
#               count +=1 if y > 0 && mine?(board, x - 1, y - 1 )
#                # mine north of y
#               count +=1 if mine?(board, x - 1, y)
#                 # mine northeast of y
#               count +=1 if y < x.size - 1 && mine?(board, x - 1, y + 1)
#               # mine west of y
#               count +=1 if mine?(board, x, y - 1)
  
#               end
#                 # mine east
#               count += 1 if y < x.size - 1 && mine?(board, x, y + 1)
  
#               if x < board.size - 1
#                 count += 1 if y < x.size - 1 && mine?(board, x + 1, y + 1)
#                 count += 1 if mine?(board, x + 1, y)
#                 count += 1 if y > 0 && mine?(board, x + 1, y - 1)
#               end
  
#             done[x][y] = count.to_s if count > 0
#             end
              
#             # end
              
#             # if (board[x][y] == "*")
#             #   mineCoordinates.push([x,y])
#             # end
#               # unless x == workBoard.length - 2
#                 # wasDereRight = workBoard[x + 1][y].to_i unless workBoard[x + 1].nil?
#                 # wasDereLeft = workBoard[x - 1][y].to_i unless workBoard[x - 1].nil?
#                 # wasDereUp = workBoard[x][y + 1].to_i unless workBoard[y + 1].nil?
#                 # wasDereDown = workBoard[x][y - 1].to_i unless workBoard[y - 1].nil?
            
#                 # wasDereTopLeftCorner = workBoard[x - 1][y - 1].to_i unless workBoard[x - 1][y - 1].nil?
#                 # wasDereTopRightCorner = workBoard[x - 1][y + 1].to_i unless workBoard[x - 1][y + 1].nil?
#                 # wasDereBottomLeftCorner = workBoard[x + 1][y - 1].to_i unless workBoard[x + 1][y - 1].nil?
#                 # wasDereBottomRightCorner = workBoard[x + 1][y + 1].to_i unless workBoard[x + 1][y + 1].nil?
#               # puts board
#               # puts workBoard[x + 1][y] # == nil?
              
#                 # workBoard[x + 1][y] = (wasDereRight += 1).to_s unless workBoard[x + 1].nil?
#                 # workBoard[x - 1][y] = (wasDereLeft += 1).to_s unless workBoard[x - 1].nil?
#                 # workBoard[x][y + 1] = (wasDereUp += 1).to_s unless workBoard[y + 1].nil?
#                 # workBoard[x][y - 1] = (wasDereDown += 1).to_s unless workBoard[y - 1].nil?
                
#                 # workBoard[x - 1][y - 1] = (wasDereTopLeftCorner += 1).to_s unless workBoard[x - 1][y - 1].nil?
#                 # workBoard[x - 1][y + 1] = (wasDereTopRightCorner += 1).to_s unless workBoard[x - 1][y + 1].nil?
#                 # workBoard[x + 1][y - 1] = (wasDereBottomLeftCorner += 1).to_s unless workBoard[x + 1][y - 1].nil?
#                 # workBoard[x + 1][y + 1] = (wasDereBottomRightCorner += 1).to_s unless workBoard[x + 1][y + 1].nil?
                
#               # end
#             # end
#           end
#            # mineCoordinates.each do |mine|
#            #    puts "mine here, #{mine}"
#            #  end
#       end
#           # puts board
#        # [x1 - x2] > 1 || [y1 - y2] >1
#       end
#   end
#   # end
  
#   def mine?(board, row, column)
#     board[row][column] == '*'
#   end
  
#   def removeBorder(board)
#       board.shift
#       board.pop
#       board.each do |spaces|
#           spaces.slice!(0)
#           spaces.chop!
  
#       end
#   end


class Board
    def self.transform(board)

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

                    # x at 0 or column size is always a boundary
                    # y at 0 or row size is always boundary
                    # if x is not border,
                    if x > 0
                        count += 1 if y > 0 && mine?(topLeft)
                        count += 1 if mine?(left)
                        count += 1 if y < x.size && mine?(topRight)
                        count += 1 if mine?(top)
                    end
                    
                    count += 1 if y < x.size - 1 && mine?(right)

                    if x < board.size - 1 
                        count += 1 if y < x.size && mine?(bottomRight)
                        count += 1 if mine?(bottom)
                        count += 1 if y > 0 && mine?(bottomLeft)
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