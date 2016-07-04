require 'sqlite3'

enviornments = ["test", "development"]

enviornments.each do |environment|
  database = SQLite3::Database.new("db/robot_world_#{environment}.db")
  database.execute("CREATE TABLE robots(
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    name VARCHAR(20),
                    city VARCHAR(20),
                    state VARCHAR(20),
                    birthdate VARCHAR(8),
                    date_hired VARCHAR(8),
                    department VARCHAR(20)
                  )")

  puts "Created database for #{environment}"
end
