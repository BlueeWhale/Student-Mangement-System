class Student
  attr_accessor :id, :name, :age, :course

  def initialize(id, name, age, course)
    @id = id
    @name = name
    @age = age
    @course = course
  end

  def to_s
    "#{@id},#{@name},#{@age},#{@course}"
  end
end