require_relative '../person'

describe 'Person' do
  context 'should create an instance of Person class' do
    person = Person.new(20, 'John', true)

    it 'takes two parameters and returns a Person object' do
      expect(person.class) == Person
    end

    it 'returns correct names of person object instance variables' do
      expect(person.age).to eq 20
      expect(person.name).to eq 'John'
    end

    it 'should return true if the age is greater than or equal to 18' do
      expect(person.can_use_services?).to eq(true)
    end

    context 'should create an instance of Person class' do
      peter = Person.new(19, 'Peter', false)
      it 'Correct name' do
        expect(peter.correct_name).to eq 'Peter'
      end
      it 'Use Service' do
        expect(peter.can_use_services?).to eq true
      end
      it 'should have rentals' do
        expect(person.rentals).to eq([])
      end
      it 'should be of age' do
        expect(peter.of_age?).to eq true
      end
    end
  end
end
