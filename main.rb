require './app'
require './menu'

class Main
  def initialize
    app = App.new
    menu = Menu.new
    puts "\nWelcome to OOP School Library App!\n\n"
    app.load_people
    app.load_books
    menu.print_menu(app)
  end
end

Main.new
