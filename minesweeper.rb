=begin
Write your code for the 'Minesweeper' exercise in this file. Make the tests in
`minesweeper_test.rb` pass.
To get started with TDD, see the `README.md` file in your
`ruby/minesweeper` directory.
=end

def minesweeper(board)
count = 0

answer = board.each do |spaces| 
    spaces.split('').each { |space|
        if (space == "*") 
            puts spaces[space].replace(count.to_s)
            # puts spaces
            # spaces[c].gsub!("*", "f")
            # puts spaces
        end
    } 
end
puts answer
end

# def count_between arr, lower, upper
#     return 0 if lower > upper
#     arr.count{|v| (lower..upper).include?(v)}
#   end

minesweeper(['+------+', '| *  * |', '|  *   |', '|    * |', '|   * *|',
        '| *  * |', '|      |', '+------+'])

        # minesweeper(['+------+', '|1*22*1|', '|12*322|', '| 123*2|', '|112*4*|',
        #     '|1*22*2|', '|111111|', '+------+'])