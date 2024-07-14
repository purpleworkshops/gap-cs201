def land
  say "The eagle has landed."
end

def launch
  3.downto(1) do |n|
    say "#{n}... "
    sleep(1)
  end
  say "Liftoff!"
end

def say(phrase)
  puts "#{phrase}"
end


puts "Good evening, this is the main thread."

t1 = Thread.new { launch }
t2 = Thread.new { land }

[t1, t2].each { |t| t.join }

puts "Signing off from the main thread."