
def surface_area(l, w, h)
  2*l*w + 2*w*h + 2*h*l
end

def smallest_side(l, w, h)
  [l*w, w*h, h*l].min
end

def shortest_perimeter(l, w, h)
  perim = ->(x, y) { 2*x + 2*y }
  [[l,w], [w,h], [h,l]].map(&perim).min
end

def volume(l, w, h)
  l*w*h
end

def wrapping_paper_needed(l, w, h)
  surface_area(l, w, h) + smallest_side(l, w, h)
end

def read_input(filename)
  open(filename, "r") do |f|
    return f.reduce({paper: 0, ribbon: 0}) do |amounts, line|
      lwh = line.split("x").map(&:to_i)
      amounts[:paper] += wrapping_paper_needed(*lwh)
      amounts[:ribbon] += shortest_perimeter(*lwh) + volume(*lwh)
      amounts
    end
  end
end

puts read_input("input.txt")
