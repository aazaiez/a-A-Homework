class Stack
  attr_accessor :stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
   @stack.each {|el| puts el}
  end

 end
