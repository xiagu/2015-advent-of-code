def nice?(string)
  three_vowels?(string) && double_letter?(string) && no_banned_strings?(string)
end

VOWELS = "aeiou"
def three_vowels?(string)
  string.chars.select { |c| VOWELS.include? c }.size >= 3
end

def double_letter?(string)
  string.chars.each_cons(2) do |first, second|
    return true if first == second
  end
  false
end

BANNED_STRINGS = %w(ab cd pq xy)
def no_banned_strings?(string)
  BANNED_STRINGS.none? { |ban| string.include? ban }
end

def run
  open("input.txt", "r") do |f|
    lines = f.readlines()
    puts lines.select { |str| nice? str }.size
  end
end

run if __FILE__ == $PROGRAM_NAME
