# frozen_string_literal: true

# creates a node at a given set of coordinates
class Knight
  attr_reader :location

  def initialize(location)
    @location = location
  end
end

# up to 8 possible children... do they need to be named variables?
