module MyEnumerable
  def all?
    if block_given?
      my_each { |item| return false unless yield(item) }
      true
    else
      all? { |obj| obj }
    end
  end

  def any?
    @list.each do |e|
      return true if yield e
    end
    false
  end

  def filter
    if block_given?
      res = []
      my_each { |item| res << item if yield(item) }
      res
    else
      self
    end
  end
end
