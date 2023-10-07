# frozen_string_literal: true

require "test_helper"

describe "Toy Robot Placement" do
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
    robot.place(-1, 0, "NORTH")
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

describe "Toy Robot Movement" do
  it "can #move" do
    robot = ToyRobot.new
    robot.place 0, 1, "NORTH"
    robot.move
    position = robot.report

    expect(position).must_equal("0, 2, NORTH")

    robot.place 0, 1, "SOUTH"
    robot.move
    position = robot.report

    expect(position).must_equal("0, 0, SOUTH")

    robot.place 1, 1, "WEST"
    robot.move
    position = robot.report

    expect(position).must_equal("0, 1, WEST")

    robot.place 1, 1, "EAST"
    robot.move
    position = robot.report

    expect(position).must_equal("2, 1, EAST")
  end

  it "does not #move if at edge" do
    robot = ToyRobot.new
    robot.place 0, 4, "NORTH"
    robot.move
    position = robot.report

    expect(position).must_equal("0, 4, NORTH")

    robot.place 0, 0, "WEST"
    robot.move
    position = robot.report

    expect(position).must_equal("0, 0, WEST")

    robot.place 4, 0, "EAST"
    robot.move
    position = robot.report

    expect(position).must_equal("4, 0, EAST")

    robot.place 0, 0, "SOUTH"
    robot.move
    position = robot.report

    expect(position).must_equal("0, 0, SOUTH")
  end
end

describe "Toy Robot Turning" do
  it "turns left" do
    robot = ToyRobot.new
    robot.place 0, 4, "NORTH"
    robot.left
    position = robot.report

    expect(position).must_equal("0, 4, WEST")

    robot.left
    position = robot.report

    expect(position).must_equal("0, 4, SOUTH")

    robot.left
    position = robot.report

    expect(position).must_equal("0, 4, EAST")

    robot.left
    position = robot.report

    expect(position).must_equal("0, 4, NORTH")
  end

  it "turns right" do
    robot = ToyRobot.new
    robot.place 0, 4, "NORTH"
    robot.right
    position = robot.report

    expect(position).must_equal("0, 4, EAST")

    robot.right
    position = robot.report

    expect(position).must_equal("0, 4, SOUTH")

    robot.right
    position = robot.report

    expect(position).must_equal("0, 4, WEST")

    robot.right
    position = robot.report

    expect(position).must_equal("0, 4, NORTH")
  end
end
