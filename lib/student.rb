class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  attr_accessor :name, :grade
  attr_reader :id

  def initialize(name, grade)
    @grade = grade
    @name = name
  end

  def self.create_table
    sql = "
    CREATE TABLE IF NOT EXISTS students (
    id INTEGER PRIMARY KEY,
    name TEXT,
    grade TEXT
    )
    "
  DB[:conn].execute(sql)
 end

 def self.drop_table
   DB[:conn].execute("DROP TABLE students")
 end

 def save
   DB[:conn].execute("INSERT INTO students (name, grade) VALUES (?,?)", self.name, self.grade)
 end
end
