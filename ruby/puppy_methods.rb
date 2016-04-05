class Puppy

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end
  
  def speak(integer)
    integer.times { puts "Woof!" }
  end
  
  def roll_over
    puts "*rolls over*"
  end
  
  def dog_years(integer)
    integer * 7
  end
  
  def sit
    puts "*sits*"
  end

end

# Release 0 
test = Puppy.new
p test.fetch("ball")
p test.speak(5)
p test.roll_over
p test.dog_years(2)
p test.sit