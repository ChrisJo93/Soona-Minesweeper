# build coordinate array by interating over input
# iterate over each each row assigning x axis value
# iterate over rows again with row[x] counting y axis
# if * any adjacents at the * coordinate defined as [x1 - x2] > 1 || [y1 - y2] >1 incrememt that coordinate by 1

# might try # array.repeated_permutation(int).map{|i,j| "#{i}-#{j}"} to build coordinates
# might try using next if row in item isn't white space, int, or * to avoid border

class Board
    def self.transform(board)

      workBoard = removeBorder(board)
      
      workBoard.each_with_index do |row, x|
        puts "rows #{row.split('')}, #{x}"
        row.split('').each_with_index do |column, y|
             puts "columns #{column}, #{y}"
             if (workBoard[x][y] == "*")
                puts "found at #{x}#{y}"
          end
        end
        #   column.split('')
        #   puts "rows #{column}, #{y}"
        # end
        # row.to_a.each_with_index do |x, xindex|
        #   puts "rows #{x}, #{xindex}"
        # row.split('').each_with_index do |spaceInRowX, x|
          # puts " this is row #{spaceInRowX}#{x}"
          # spaceInRowX.each_with_index do |_spaceInRowY, y|
            
          #           puts "row at x #{_spaceInRowY}#{y}"
          # end
        end
        #   
        #     puts "this is xcoords #{row}#{x} "
        #     puts "this is ycoords #{cell}#{y} "
        #   end
  
        # rowItem = row.split('')
      end
  end

# class Board
#     def self.transform(board)
    
#         removeBorder(board).each do |rows|
#             rows.chars.each_with_index do |spaceInRow, index|
#                 puts spaceInRow[0]
#                 rowNum += 1
#                 if (spaceInRow == "*")
                    
#                     spaceInRow[index - 1] = "1" unless spaceInRow[index - 1].nil?
#                     # spaceInRow[index + 1] = "1"
                    
#                     # puts spaceInRow[index - 1] = rowNum.to_s and spaceInRow[index + 1] = rowNum.to_s
#                 end
                
#             end
        
#         end

#         puts board
#     end

   
# end

def removeBorder(board)
    board.shift
    board.pop
    board.each do |spaces|
        spaces.slice!(0)
        spaces.chop!

    end
end


 # board.each do |rowOfBoard| 
            # # puts currentRow = "current row is #{rowOfBoard}" #will print individual row as they come in
            #     modifiedRow = rowOfBoard.split('').each_with_index do |space, index|
            # count = 0;
            # if (space == "*") 
                
            #     left = index - 1
            #     right = index + 1
    
            # left and right positions of a * but doesn't catch adjacents/gets hung up on border
            #     # puts rowOfBoard[left] = count += 1
            #     # puts rowOfBoard[right] = count += 1
                
                
            #     puts space[left] = "1"
                # puts "space is #{space} index is #{index}"
        


# testing without suite
Board.transform(['+------+', '| *  * |', '|  *   |', '|    * |', '|   * *|',
        '| *  * |', '|      |', '+------+'])
