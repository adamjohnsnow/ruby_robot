# frozen_string_literal: true

require "test_helper"

describe "Toy Robot Routine" do
  it "follows the instructions" do
    robot = ToyRobot.new

    robot.place(0, 0, "NORTH")
    robot.move
    position = robot.report

    expect(position).must_equal("0, 1, NORTH")

    robot.place(0, 0, "NORTH")
    robot.left
    position = robot.report

    expect(position).must_equal("0, 0, WEST")

    robot.place(1, 2, "EAST")
    robot.move
    robot.move
    robot.left
    robot.move
    position = robot.report

    expect(position).must_equal("3, 3, NORTH")
  end
end