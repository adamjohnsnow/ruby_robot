# frozen_string_literal: true

require "test_helper"

describe "Toy Robot" do
  it "does not have coordinates or direction on initialise" do
    robot = ToyRobot.new
    position = robot.report

    refute position
  end

  it "gets placed" do
    robot = ToyRobot.new
    robot.place 0, 0, "NORTH"
    position = robot.report

    expect(position).must_equal("0, 0, NORTH")

    robot.place 3, 2, "SOUTH"
    position = robot.report

    expect(position).must_equal("3, 2, SOUTH")
  end

  it "validates placement" do
    robot = ToyRobot.new
    robot.place -1, 0, "NORTH"
    position = robot.report

    refute position

    robot.place "X", 0, "NORTH"
    position = robot.report

    refute position

    robot.place 1, 5, "NORTH"
    position = robot.report

    refute position

    robot.place 1, 1, "TEST"
    position = robot.report

    refute position
  end
end
