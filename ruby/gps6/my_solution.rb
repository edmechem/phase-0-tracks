# Virus Predictor

# I worked on this challenge by myself, with guide Jen Trudell.
# I spent 2 hours total on this challenge (she guided for the first hour).

# EXPLANATION OF require_relative
# 
# require_relative allows this program to access data in another file, namely
# 'state_data' (presumes the .rb filename extension), from the same directory
# that this file lives in.

require_relative 'state_data'

class VirusPredictor

  # Initializes new instance of VirusPredictor class,
  # taking three parameters/arguments, which are string, float & integer,
  # respectively. Assigns them to corresponding instance variables
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  # Call two other methods
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  # Within a class, private serves as a dividing line - all methods above it are
  # callable from outside the class, all methods below it are
  # not callable from outside the class.

  # You'd want private methods, let's say - in a class used for banking. So, in this
  # example - only the "authorize_with_PIN" method (callable from outside) would be
  # allowed to call the "withdraw_cash" method - the "withdraw_cash" method
  # would be a private method, not callable from outside the class.
  private


  # Release 8 refactoring of predicted_deaths
    
  # Uses an algorithm to determine the predicted deaths.
  def predicted_deaths
    # predicted deaths is solely based on population density

    # declare a multiplier variable
    multiplier = 0.0

    if @population_density >= 200
      multiplier = 0.4
    elsif @population_density >= 150
      multiplier = 0.3
    elsif @population_density >= 100
      multiplier = 0.2
    elsif @population_density >= 50
      multiplier = 0.1
    else
      multiplier = 0.05
    end

    # now there's just 1 line representing the formula, instead of 5
    number_of_deaths = (@population * multiplier).floor

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end


  # Release 8 refactoring...   I can't really think of a way to refactor
  # the speed_of_spread...   Perhaps a hash of density & additional_speed_to_add,
  # and but then we'd need a way of seeing if the density was >= to the values
  # which...  I don't know how we'd do that in any way that's more compact
  # than what we have now...

  # Uses an algorithm based on density to determine a speed factor
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else
      speed += 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects


# Release 5
# Build the new driver code & test it:
# STATE_DATA.each do | state_name, state_data|
    # test the syntax
    # puts "The data for #{state_name} is Density: #{state_data[:population_density]} and Population: #{state_data[:population]}"

    # a_state = VirusPredictor.new( state_name, state_data[:population_density], state_data[:population])
    # a_state.virus_effects
# end

# Lean final version:
STATE_DATA.each { | state_name, state_data| VirusPredictor.new( state_name, state_data[:population_density], state_data[:population]).virus_effects }




#=======================================================================
# Reflection Section

# The two different hash syntaxes in the state_data file, are "hash rocket" (the 'outer hash' where the state is the key, and its data is the value ) - and using symbol notation (:population_density and :population)

# require_relative 'state_data' brings in the entire contents of the file 'state data', which consists entirely of one huge constant (the hashy hash of state data). "require" would do the exact same thing, but would require an absolute file path, versus a relative one - which would make it more brittle & less portable. So it's better to use require_relative.

# hash.each is the most common & useful way of iterating through a hash we've learned so far. There are other methods that are conditional, i.e. hash.delete_if or hash.keep_if. One could also use "for k,v in {hash}" notation, which is very similar to each.

# virus_effects as written, appeared to be passing meaningless variables to the two other methods it called - they were missing the @ symbol, so they weren't actually anything (as passed).  Everything worked, because virus_effects was passing the *correct number* of variables these two methods expected - *and* because, under the hood - the two methods really didn't even use what was passed to them - they just drew upon the instance variables that were filled in upon initialization.

# The concept I most solidified in this challenge were hash notation, especially for hashes inside of hashes. I also learned about constants.  I also learned a bit more about refactoring.
