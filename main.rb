require_relative 'student'

FILE_NAME = "student.txt"

def add_student
  print "Enter ID: "
  id = gets.chomp

  print "Enter Name: "
  name = gets.chomp

  print "Enter Age: "
  age = gets.chomp

  print "Enter Course: "
  course = gets.chomp

  student = Student.new(id, name, age, course)

  File.open(FILE_NAME, "a") do |file|
    file.puts student
  end

  puts "Student Added Successfully!"
end

def view_students
  if File.exist?(FILE_NAME)
    puts "\n--- Student List ---"
    File.readlines(FILE_NAME).each do |line|
      puts line
    end
  else
    puts "No Students Found!"
  end
end

def search_student
  print "Enter Student ID: "
  id = gets.chomp

  found = false

  File.readlines(FILE_NAME).each do |line|
    data = line.chomp.split(",")

    if data[0] == id
      puts "\nStudent Found:"
      puts "ID: #{data[0]}"
      puts "Name: #{data[1]}"
      puts "Age: #{data[2]}"
      puts "Course: #{data[3]}"
      found = true
    end
  end

  puts "Student Not Found!" unless found
end

def delete_student
  print "Enter Student ID to Delete: "
  id = gets.chomp

  students = File.readlines(FILE_NAME)

  students.reject! do |line|
    line.split(",")[0] == id
  end

  File.write(FILE_NAME, students.join)

  puts "Student Deleted Successfully!"
end

def update_student
  print "Enter Student ID to Update: "
  id = gets.chomp

  students = File.readlines(FILE_NAME)
  found = false

  students.map! do |line|
    data = line.chomp.split(",")

    if data[0] == id
      found = true

      print "Enter New Name: "
      new_name = gets.chomp

      print "Enter New Age: "
      new_age = gets.chomp

      print "Enter New Course: "
      new_course = gets.chomp

      "#{id},#{new_name},#{new_age},#{new_course}\n"
    else
      line
    end
  end

  if found
    File.write(FILE_NAME, students.join)
    puts "Student Updated Successfully!"
  else
    puts "Student Not Found!"
  end
end

loop do
  puts "\n===== Student Management System ====="
  puts "1. Add Student"
  puts "2. View Students"
  puts "3. Search Student"
  puts "4. Delete Student"
  puts "5. Update Student"
  puts "6. Exit"

  print "Choose Option: "
  choice = gets.chomp.to_i

  case choice
when 1
  add_student
when 2
  view_students
when 3
  search_student
when 4
  delete_student
when 5
  update_student
when 6
  puts "Goodbye!"
  break
else
  puts "Invalid Choice!"
end

end