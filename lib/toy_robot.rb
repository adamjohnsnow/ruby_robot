# frozen_string_literal: true

DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze
MAX_X = 4
MAX_Y = 4

class ToyRobot
  def place(x_start, y_start, direction)
    return unless valid_placement? x_start, y_start, direction

    @x_coordinate = x_start
    @y_coordinate = y_start
    @direction = direction
  end

  def report
    return unless @x_coordinate && @y_coordinate && @direction

    "#{@x_coordinate}, #{@y_coordinate}, #{@direction}"
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
    end
  end

  def left
    return unless @direction

    if @direction == "NORTH"
      @direction = "WEST"
    else
      current_index = DIRECTIONS.find_index(@direction)
      @direction = DIRECTIONS[current_index - 1]
    end
  end

  def right
    return unless @direction

    if @direction == "WEST"
      @direction = "NORTH"
    else
      current_index = DIRECTIONS.find_index(@direction)
      @direction = DIRECTIONS[current_index + 1]
    end
  end

  private

  def valid_placement?(x_start, y_start, direction)
    return false unless x_start.is_a?(Integer) && x_start.between?(0, MAX_X)
    return false unless y_start.is_a?(Integer) && y_start.between?(0, MAX_Y)
    return false unless DIRECTIONS.include? direction

    true
  end

  def valid_move?
    case @direction
    when "NORTH"
      return false if @y_coordinate == MAX_Y
    when "EAST"
      return false if @x_coordinate == MAX_X
    when "SOUTH"
      return false if @y_coordinate.zero?
    when "WEST"
      return false if @x_coordinate.zero?
    else
      return false
    end
    true
  end
end
