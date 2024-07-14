def land
  x = 10
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

launch
land
