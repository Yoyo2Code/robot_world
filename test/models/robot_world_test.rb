require_relative '../test_helper'

class RobotWorldTest < Minitest::Test
  include TestHelpers

  def current_robot_id
    robot_world.all.first.id
  end

    {"name" => "Bender",
    "city" => "Kansas",
    "state" => "Colorado",
    "birthdate" => "01/01/1990",
    "date_hired" => "01/02/1990",
    "department" => "Hero"}

  def test_it_creates_a_robot
    robot_world.create(robot_one)

    robot = robot_world.find(current_robot_id)

    assert_equal "Bender", robot.name
    assert_equal "Kansas", robot.city
    assert_equal "Colorado", robot.state
    assert_equal "01/01/1990", robot.birthdate
    assert_equal "01/02/1990", robot.date_hired
    assert_equal "Hero", robot.department
    assert_equal current_robot_id, robot.id
  end

  def  test_it_can_find_all_robots
    robot_world.create(robot_one)
    robot_world.create(robot_two)

    robots = robot_world.all

    assert_equal 2, robots.size
    assert_equal "Bender", robots.first.name
    assert_equal "Bob", robots.last.name
  end

  def test_it_can_find_a_single_robot
    robot_world.create(robot_three)

    robot = robot_world.find(current_robot_id)

    assert_equal "Robby", robot.name
    assert_equal "Florida", robot.state
  end

  def test_it_can_update_a_robot
    robot_world.create(robot_two)

    robot_world.update(current_robot_id, robot_three)

    robot = robot_world.find(current_robot_id)

    assert_equal "Robby", robot.name
  end

  def test_it_can_destroy_a_robot
    robot_world.create(robot_three)

    assert_equal 1, robot_world.all.size

    robot_world.destroy(current_robot_id)

    assert_equal 0, robot_world.all.size
  end

  def robot_one
     {"name" => "Bender",
     "city" => "Kansas",
     "state" => "Colorado",
     "birthdate" => "01/01/1990",
     "date_hired" => "01/02/1990",
     "department" => "Hero"}
  end

  def robot_two
     {"name" => "Bob",
     "city" => "Tampa",
     "state" => "Florida",
     "birthdate" => "01/05/1992",
     "date_hired" => "01/10/1995",
     "department" => "Villian"}
  end

  def robot_three
     {"name" => "Robby",
     "city" => "Miami",
     "state" => "Florida",
     "birthdate" => "01/03/1990",
     "date_hired" => "01/04/1990",
     "department" => "Sidekick"}
  end
end
