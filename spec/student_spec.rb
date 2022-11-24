require_relative '../student'
describe 'Student' do
  context 'should create an instance of Student class' do
    student = Student.new(20, 'Classroom', 'John', true)

    it 'takes four parameters and returns a Student object' do
      expect(student.class) == Student
    end

    it 'returns correct names of student object instance variables' do
      expect(student.age).to eq 20
      expect(student.classroom).to eq 'Classroom'
      expect(student.name).to eq 'John'
    end

    it 'should return true if the age is greater than or equal to 18' do
      expect(student.can_use_services?).to eq(true)
    end
  end
end
