require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    @classroom = classroom
    super(age, name, parent_permission)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end

puts 'Enter Student Name'
new_name = gets.chomp
puts 'Enter Student Classroom'
new_classroom = gets.chomp
puts 'Enter Student Age'
new_age = gets.chomp.to_i

stud = Student.new(new_age, new_classroom, new_name)
puts("Student Id: #{stud.id}")
puts("Student Name: #{stud.name}")
puts("Student Classroom: #{stud.classroom}")
puts("Student Age: #{stud.age}")
