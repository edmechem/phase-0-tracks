# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
# 
# require_relative allows this program to access data in another file, namely
# 'state_data' (presumes the .rb filename extention), from the same directory
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
    predicted_deaths(@population_density, @population, @state)
    speed_of_spread(@population_density, @state)
  end

  private

  # Takes the three instance variables, & uses an algorithm
  # to determine the predicted deaths.
  def predicted_deaths(population_density, population, state) # doesn't need these!
    # predicted deaths is solely based on population density
    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
    elsif @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
    elsif @population_density >= 50
      number_of_deaths = (@population * 0.1).floor
    else
      number_of_deaths = (@population * 0.05).floor
    end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

  # Uses an algorithm based on density to determine a speed factor
  def speed_of_spread(population_density, state) #in months
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