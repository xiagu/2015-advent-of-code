class LightGrid
  attr_reader :grid

  def initialize(x = 1000, y = 1000)
    @grid = (0...1000).map { [0]*1000 }
  end

  COORD_REGEXP = /(?<x1>\d+),(?<y1>\d+) through (?<x2>\d+),(?<y2>\d+)/
  TURN_ON = /turn on/
  TURN_OFF = /turn off/
  TOGGLE = /toggle/

  def brightness
    grid.reduce(0) do |sum, col|
      sum + col.reduce(0) { |s, x| s + x }
    end
  end

  def instr(instruction)
    fail "No match" unless COORD_REGEXP =~ instruction
    coords = [:x1, :y1, :x2, :y2].map { |v| $~[v].to_i }

    operation =
      case instruction
      when TURN_ON
        ->(x, y) { @grid[x][y] += 1 }
      when TURN_OFF
        ->(x, y) { @grid[x][y] = [@grid[x][y] - 1, 0].max }
      when TOGGLE
        ->(x, y) { @grid[x][y] += 2 }
      else
        fail "Explosion"
      end

    coord_handle(*coords, operation)
    self
  end

  private

  def flip(i)
    i == 0 ? 1 : 0
  end

  def coord_handle(x1, y1, x2, y2, operation)
    (x1..x2).each do |x|
      (y1..y2).each do |y|
        operation.call(x, y)
      end
    end
  end
end

def run
  grid = LightGrid.new

  open("input.txt", "r") do |file|
    file.each_line do |line|
      grid.instr(line)
    end
  end

  puts grid.brightness
end

run if __FILE__ == $PROGRAM_NAME
