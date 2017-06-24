require_relative('lib/board')
require_relative('lib/queen')

def solve_queens_problem
	@board.columns.times do |column|
		puts "\n Trying Queen ##{column+1}" if @verbose

@board.rows.times do |row|
	if @board.safe_position?(column,row)
	puts "+ Placing Queen ##{column+1} at #{column}, #{row}" 	if @verbose 
		@board.place_queen(column,row)
		@board.display if @verbose
			if column == @board.ending_column
				puts "! Soluntion Found \n " if @verbose
				@solution_found = true
				return 
			else # exit the function
				break
			end


else 
	puts "x Conflict at #{column}, #{row}" if @verbose
	if row < @board.ending_row
		next
	else
		puts "! No solution for Queen ##{column+1}, backtracking.." if @verbose
	end
end
end

	end
end

@verbose = true
@solution_found = false
@board = Board.new

	solve_queens_problem

	if @solution_found
		puts "\nsolution found"
		@board.display
	else
		puts "\nNo solution found"
	end