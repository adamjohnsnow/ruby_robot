# frozen_string_literal: true

DIRECTIONS = [ "NORTH", "EAST", "SOUTH", "WEST" ]

class ToyRobot
  def place x, y, direction
    return unless valid_placement? x, y, direction
    @x_coordinate = x
    @y_coordinate = y
    @direction = direction
  end

  def report
    return unless @x_coordinate && @y_coordinate && @direction
    return "#{@x_coordinate}, #{@y_coordinate}, #{@direction}"
  end

  private

  def valid_placement? x, y, direction
    return false unless x.is_a?(Integer) && x.between?(0, 4)
    return false unless y.is_a?(Integer) && y.between?(0, 4)
    return false unless DIRECTIONS.include? direction
    return true
  end
end
