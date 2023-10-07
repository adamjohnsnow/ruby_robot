# frozen_string_literal: true

require "csv"

require_relative "./lib/toy_robot"

robot = ToyRobot.new

instructions = CSV.read("./files/instructions.csv", headers: false)

instructions.each do |line|
  case line[0]
  when "PLACE"
    robot.place(line[1].to_i, line[2].to_i, line[3])
  when "REPORT"
    p robot.report
  when "MOVE"
    robot.move
  when "LEFT"
    robot.left
  when "RIGHT"
    robot.right
  end
end
