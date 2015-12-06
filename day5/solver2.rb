def nice?(string)
  non_overlapping_duplicate?(string) && repeat_one_apart?(string)
end

def non_overlapping_duplicate?(string)
  string =~ /(\w\w)\w*\1/
end

def repeat_one_apart?(string)
  string =~ /(\w)\w\1/
end

def run
  open("input.txt", "r") do |f|
    lines = f.readlines()
    puts lines.select { |str| nice? str }.size
  end
end

run if __FILE__ == $PROGRAM_NAME
