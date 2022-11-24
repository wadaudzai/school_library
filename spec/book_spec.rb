require_relative '../book'

describe 'Book' do
  context 'should create an instance of Book class' do
    book = Book.new('Hobbit', 'Jhon')

    it 'takes two parameters and returns a Book object' do
      expect(book.class) == Book
    end
    it 'returns correct names of book object instance variables' do
      expect(book.title).to eq 'Hobbit'
      expect(book.author).to eq 'Jhon'
    end
    it 'should return true if the age is greater than or equal to 18' do
      expect(book.rentals).to eq([])
    end
  end
end
