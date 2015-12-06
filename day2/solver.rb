
def surface_area(l, w, h)
  2*l*w + 2*w*h + 2*h*l
end

def smallest_side(l, w, h)
  [l*w, w*h, h*l].min
end

def wrapping_paper_needed(l, w, h)
  surface_area(l, w, h) + smallest_side(l, w, h)
end

def read_input(filename)
  open(filename, "r") do |f|
    return f.reduce(0) do |area, line|
      length, width, height = line.split("x").map(&:to_i)
      area + wrapping_paper_needed(length, width, height)
    end
  end
end

puts read_input("input.txt")
