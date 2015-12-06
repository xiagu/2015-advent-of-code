
floor = 0
basement_character_position = -1

open("input.txt", "r") do |file|
  file.each_char.with_index(1) do |char, index|
    case char
    when "("
      floor += 1
    when ")"
      floor -= 1
    end
    if basement_character_position == -1 && floor == -1
      basement_character_position = index
      break
    end
  end
end

puts basement_character_position
