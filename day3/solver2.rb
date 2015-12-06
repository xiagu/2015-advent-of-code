
class HouseLocation
  DIRS = "^>v<"

  attr_accessor :x, :y

  def initialize(x = 0, y = 0)
    @x = x
    @y = y
  end

  def north
    @y += 1
    self
  end

  def south
    @y -= 1
    self
  end

  def east
    @x += 1
    self
  end

  def west
    @x -= 1
    self
  end

  def deliver(direction)
    case direction
    when "^"
      north
    when ">"
      east
    when "v"
      south
    when "<"
      west
    end
  end

  def to_s
    "[#{@x}, #{@y}]"
  end

  def eql?(other)
    other.x == x && other.y == y
  end

  def hash
    to_s.hash
  end
end

class HouseGrid
  attr_accessor :grid

  def initialize
    @grid = {}
  end

  def count_spot(location)
    loc = location.to_s
    @grid[loc] = @grid.fetch(loc, 0) + 1
  end
end

def run(enumerable)
  grid = HouseGrid.new
  santa = HouseLocation.new(0, 0)
  robosanta = HouseLocation.new(0, 0)
  grid.count_spot(santa)
  grid.count_spot(robosanta)

  move_santa = true
  enumerable.each_char do |char|
    loc_to_use = if move_santa then santa else robosanta end
    if char && HouseLocation::DIRS.include?(char)
      grid.count_spot loc_to_use.deliver(char)
    end
    move_santa = !move_santa
  end

  puts grid.grid.size
end

open("input.txt", "r") do |file|
  run(file)
end
