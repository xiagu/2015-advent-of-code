
floor = 0
open("input.txt", "r") do |file|
  file.each_char do |char|
    case char
    when "("
      floor += 1
    when ")"
      floor -= 1
    end
  end
end

puts floor
