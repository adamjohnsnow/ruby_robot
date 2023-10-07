# frozen_string_literal: true

DIRECTIONS = [ "NORTH", "EAST", "SOUTH", "WEST" ]
MAX_X = 4
MAX_Y = 4

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

  def move
    return unless valid_move?

    case @direction
    when "NORTH"
      @y_coordinate = @y_coordinate.next
    when "EAST"
      @x_coordinate = @x_coordinate.next
    when "SOUTH"
      @y_coordinate = @y_coordinate.pred
    when "WEST"
      @x_coordinate = @x_coordinate.pred
    else
      return
    end
  end

  private

  def valid_placement? x, y, direction
    return false unless x.is_a?(Integer) && x.between?(0, MAX_X)
    return false unless y.is_a?(Integer) && y.between?(0, MAX_Y)
    return false unless DIRECTIONS.include? direction
    return true
  end

  def valid_move?
    case @direction
    when "NORTH"
      return false if @y_coordinate == MAX_Y
    when "EAST"
      return false if @x_coordinate == MAX_X
    when "SOUTH"
      return false if @y_coordinate == 0
    when "WEST"
      return false if @x_coordinate == 0
    else
      return false
    end

    return true
  end
end
