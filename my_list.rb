require_relative 'my_enumerable'

class MyList
  include MyEnumerable
  attr_reader :list

  def initialize(*list)
    @list = list
  end

  def my_each()
    (0...@list.length).each { |item| yield @list[item] }
  end
end
