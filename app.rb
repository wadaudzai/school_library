require './book'
require './classroom'
require './person'
require './rental'
require './student'
require './teacher'
require 'json'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def store_people
    people = @people.map do |person|
      { type: person.class, name: person.name, id: person.id, age: person.age, specialization: person.specialization }
    end
    people = JSON.generate(people)
    File.write('./store/people.json', people)
  end

  def load_people
    return unless File.exist?('./store/people.json')

    JSON.parse(File.read('./store/people.json')).each do |person|
      @people << if person['type'] == 'Student'
                   Student.new(person['age'], person['name'])
                 else
                   Teacher.new(person['age'], person['specialization'], person['name'])
                 end
    end
  end

  def store_books
    books = @books.map { |book| { title: book.title, author: book.author } }
    books = JSON.generate(books)
    File.write('./store/books.json', books)
  end

  def load_books
    return unless File.exist?('./store/books.json')

    JSON.parse(File.read('./store/books.json')).each do |book|
      @books << Book.new(book['title'], book['author'])
    end
  end

  def list_books
    puts 'Books: '
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    puts ''
  end

  def list_people
    puts 'People: '
    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    puts ''
  end

  def create_student
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Classroom: '
    classroom = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    @people << Student.new(age, classroom, name, parent_permission)
  end

  def create_teacher
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Specialization: '
    specialization = gets.chomp
    @people << Teacher.new(age, specialization, name)
  end

  def create_person
    puts 'Do you want to crete a student (1) or a teacher (2)?'
    print '[Input the number]: '
    person_type = gets.chomp.to_i

    case person_type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid option'
      return
    end
    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts "Book created successfully\n\n"
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
    book_number = gets.chomp.to_i
    puts 'Select a Person from the following list by number (not ID)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_number = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    @rentals << Rental.new(date, @people[person_number], @books[book_number])
    puts "Rental created successfully \n\n"
  end

  def store_rentals
    rentals = @rentals.map do |rental|
      {
        date: rental.date,
        person: { type: rental.person.class, name: rental.person.name, id: rental.person.id, age: rental.person.age,
                  specialization: rental.person.specialization },
        book: { title: rental.book.title, author: rental.book.author }
      }
    end
    File.write('./store/rentals.json', JSON.generate(rentals))
  end

  def load_rentals
    return unless File.exist?('./store/rentals.json')

    JSON.parse(File.read('./store/rentals.json')).each do |rental|
      if rental['person']['type'] == 'Student'
        person = Student.new(rental['person']['age'], rental['person']['name'])
        book = Book.new(rental['book']['title'], rental['book']['author'])
      else
        person = Teacher.new(rental['person']['age'], rental['person']['specialization'], rental['person']['name'])
        book = Book.new(rental['book']['title'], rental['book']['author'])
      end
      @rentals << Rental.new(rental['date'], person, book)
    end
  end

  def list_rentals
    print 'ID of person: '
    person_id = gets.chomp
    puts 'Rentals: '
    @rentals.each do |rental|
      if rental.person.id.to_s == person_id.to_s
        puts "#{rental.class} #{rental.date} | Book: \"#{rental.book.title}\" rented by #{rental.person.name}"
      end
    end
    puts ''
  end
end
