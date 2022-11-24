require_relative '../classroom'
require_relative '../student'

describe Classroom do
  context 'should create an instance of Classroom class' do
    classroom = Classroom.new('Computer Science')

    it 'takes one parameter and returns a Classroom object' do
      expect(classroom.class).to eq(Classroom)
    end

    it 'returns correct names of classroom object instance variables' do
      expect(classroom.label).to eq('Computer Science')
    end

    it 'should successfully add a student to the classroom' do
      student = Student.new(20, 'Computer Science', 'John', true)
      classroom.add_student(student)
      expect(classroom.students).to eq([student])
    end
  end
end
