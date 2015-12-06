require "digest"

INPUT = "iwrupvqb"

i = 0
loop do
  i += 1

  break if (Digest::MD5.hexdigest "#{INPUT}#{i}")[0..5] == "000000"
end

puts i
