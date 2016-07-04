require_relative 'robot'

class RobotWorld
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)
    database.execute("INSERT INTO robots (name, city, state, birthdate, date_hired, department) VALUES (?, ?, ?, ?, ?, ?);", robot["name"], robot["city"], robot["state"], robot["birthdate"], robot["date_hired"], robot["department"])
  end

  def robots_in_world
    database.execute("SELECT * FROM robots;")
  end

  def all
    robots_in_world.map { |data| Robots.new(data) }
  end

  def single_robot(id)
    database.execute("SELECT * FROM robots WHERE id= ?", id).first
  end

  def find(id)
    Robots.new(single_robot(id))
  end

  def update(id, robot)
    database.execute("UPDATE robots SET name = ?, city= ?, state = ?, birthdate = ?, date_hired = ?, department = ?;",
                    robot["name"],
                    robot["state"],
                    robot["birthdate"],
                    robot["date_hired"],
                    robot["department"],
                    id)
  end

  def destroy(id)
      database.execute("DELETE FROM robots WHERE id = ?;", id)
  end

  def delete_all
    database.execute("DELETE FROM robots;")
  end
end
