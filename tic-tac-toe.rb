# set the rules of the game
class TicTacToe
  attr_accessor :grid, :player_o, :player_x
  def initialize
    # set board game
    @grid = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    # set players
    @player_x = Player.new('Challenger X', 'X')
    @player_o = Player.new('Challenger O', 'O')
    # starter player
    @current_player = @player_x
    @taken_pos = []
   
  end

  # print the board
  def print_board
    col_sep = '|' # between each number
    row_sep = '---+---+---' # between each row
    "#{@grid[0]} #{col_sep} #{@grid[1]} #{col_sep} #{@grid[2]}
    #{row_sep}
    #{@grid[3]} #{col_sep} #{@grid[4]} #{col_sep} #{@grid[5]}
    #{row_sep}
    #{@grid[6]} #{col_sep} #{@grid[7]} #{col_sep} #{@grid[8]} ".lines.map { |str| str.strip.center(30) }.join("\n")
  end

  # Look the winning combination
  def combination(player)
    code = [[@grid[0], @grid[1], @grid[2]],
            [@grid[3], @grid[4], @grid[5]],
            [@grid[6], @grid[7], @grid[8]],
            [@grid[0], @grid[3], @grid[6]],
            [@grid[1], @grid[4], @grid[7]],
            [@grid[2], @grid[5], @grid[8]],
            [@grid[0], @grid[4], @grid[8]],
            [@grid[2], @grid[4], @grid[6]]] # Rows 3, columns 3, diagonals 2
    code.each do |combi| # for every block in the array check is one symbol(x or o) get it.
      combi.all? {|pos| @grid[pos] == player}
    end
  end

  # full game
  def full
    @grid.empty?# if the array hash etc is empty
  end

  # play game
  def play
    # loop
    loop do
      # set the board
      puts print_board
      # get the value selected by players
      get_selection
      if @taken_pos.length == 9 || victory
        # break if the game is over
        return game_over
      else
        # swith player
        swith_player
      end
    end
  end

  # check if the game is over.
  def game_over
    # look if this is true
    if victory
      puts "#{@current_player}/n You Win!"
    elsif full_board
      p full
    end
  end

  # Victory ?
  def victory
    if combination(@current_player.symbol)
      # return message of winner player
      true
    else
      false
    end
  end

  # Full board ?
  def full_board
    puts 'Game finish'
  end

  # Siwth player after each play!
  def swith_player
    # If in ternary
    @current_player = @current_player == @player_x ? @player_o : @player_x
  end

  # get value
  def get_selection
    puts "#{@current_player.name} please select postion to put your #{@current_player.symbol}!"
    selection = gets.chomp.to_i
    return error_selection unless (1..9).to_a.include?(selection)
    return taken_position(selection) if @taken_pos.include?(selection)

    selection
    add_position(selection, @current_player.symbol)
  end

  # return error
  def error_selection
    puts 'Invalid selection. Please enter a number between 1 and 9'
    get_selection
  end

  # Already take
  def taken_position(selection)
    puts "This position #{selection} is not available"
    get_selection
  end

  # Remplace number position by symbol
  def add_position(number, symbol)
    @grid[number - 1] = symbol
    @taken_pos << number
  end
end

# Get the player information and
class Player
  attr_reader :name, :symbol
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end

try = TicTacToe.new.play
p try
