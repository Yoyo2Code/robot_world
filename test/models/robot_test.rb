require_relative '../test_helper'

class RobotTest < Minitest::Test
  include TestHelpers

  def test_robot_id
    robot = create_robot
    assert_equal 1, robot.id
  end

  def test_robot_name
    robot = create_robot
    assert_equal "Bender", robot.name
  end

  def test_robot_city
    robot = create_robot
    assert_equal "Kansas", robot.city
  end

  def test_robot_state
    robot = create_robot
    assert_equal "Colorado",robot.state
  end

  def test_robot_birthdate
    robot = create_robot
    assert_equal "01/01/1990", robot.birthdate
  end

  def test_robot_hire_date
    robot = create_robot
    assert_equal "01/02/1990", robot.date_hired
  end

  def test_department
    robot = create_robot
    assert_equal "Hero", robot.department
  end

  def data
    {id: 1,
     name: "Bender",
     city: "Kansas",
     state: "Colorado",
     birthdate: "01/01/1990",
     date_hired: "01/02/1990",
     department: "Hero"}
  end

  def create_robot
    data = {"id" => 1,
            "name" => "Bender",
            "city" => "Kansas",
            "state" => "Colorado",
            "birthdate" => "01/01/1990",
            "date_hired" => "01/02/1990",
            "department" => "Hero"}

    Robots.new(data)
  end
end
