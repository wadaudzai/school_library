require './app'
require './menu'

def main
  app = App.new
  menu = Menu.new
  puts "\nWelcome to OOP School Library App!\n\n"
  menu.print_menu(app)
end

def user_input
  input = gets.chomp.to_i
  while input > 7 || input < 1
    puts 'Please enter a valid option between 1 to 7: '
    input = gets.chomp.to_i
  end
  input
end

main
