# frozen_string_literal: true

DIRECTIONS = [ "NORTH", "EAST", "SOUTH", "WEST" ]

class ToyRobot
  def place x, y, direction
    @x_coordinate = x
    @y_coordinate = y
    @direction = direction
  end

  def report

    return @x_coordinate, @y_coordinate, @direction
  end
end
