require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  context 'should return an instance of a Rental class' do
    person = Person.new(26, 'Peter')
    book = Book.new('Game of Thrones', 'George Martin')
    rental = Rental.new('2020-03-23', person, book)

    it 'takes three parameters and returns a correctly configuered Rental object' do
      expect(rental.class).to eq(Rental)
      expect(rental.date).to eq('2020-03-23')
      expect(rental.person.name).to eq('Peter')
      expect(rental.book.title).to eq('Game of Thrones')
    end

    it 'adds the rental to the Person object' do
      expect(person.rentals).to eq([rental])
    end

    it 'adds the rental to the Book object' do
      expect(book.rentals).to eq([rental])
    end
  end
end
