# frozen_string_literal: true

DIRECTIONS = %i[north east south west].freeze
MAX_X = 4
MAX_Y = 4

class ToyRobot
  def place(x_start, y_start, facing)
    direction = facing.downcase.to_sym

    return unless valid_placement? x_start, y_start, direction

    @x_coordinate = x_start
    @y_coordinate = y_start
    @direction = direction
  end

  def report
    return unless @x_coordinate && @y_coordinate && @direction

    "#{@x_coordinate}, #{@y_coordinate}, #{@direction.to_s.upcase}"
  end

  def move
    return unless valid_move?

    case @direction
    when :north
      @y_coordinate = @y_coordinate.next
    when :east
      @x_coordinate = @x_coordinate.next
    when :south
      @y_coordinate = @y_coordinate.pred
    when :west
      @x_coordinate = @x_coordinate.pred
    end
  end

  def left
    return unless @direction

    if @direction == :north
      @direction = :west
    else
      current_index = DIRECTIONS.find_index(@direction)
      @direction = DIRECTIONS[current_index - 1]
    end
  end

  def right
    return unless @direction

    if @direction == :west
      @direction = :north
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
    when :north
      return false if @y_coordinate == MAX_Y
    when :east
      return false if @x_coordinate == MAX_X
    when :south
      return false if @y_coordinate.zero?
    when :west
      return false if @x_coordinate.zero?
    else
      return false
    end
    true
  end
end
