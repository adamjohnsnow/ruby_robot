# frozen_string_literal: true

require "csv"

require_relative "./lib/toy_robot"

robot = ToyRobot.new

instructions = CSV.read("./files/instructions.csv", headers: false)

VALID_COMMANDS = %i[place move left right report].freeze

instructions.each do |line|
  command = line[0].downcase.to_sym

  next unless VALID_COMMANDS.include?(command)

  case line[0].downcase.to_sym
  when :place
    robot.place(line[1].to_i, line[2].to_i, line[3])
  when :report
    p robot.report
  when :move
    robot.move
  when :left
    robot.left
  when :right
    robot.right
  end
end
