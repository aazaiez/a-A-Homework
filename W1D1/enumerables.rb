class Array
  def my_each(&block)
    0.upto(self.length - 1) do |idx|
      block.call(self[idx])
    end

    return self
  end

  def my_select(&block)
    new_arr = []
    0.upto(self.length - 1) do |idx|
      new_arr.push(self[idx]) if block.call(self[idx])
    end

    return new_arr
  end

  def my_reject(&block)
    new_arr = []
    0.upto(self.length - 1) do |idx|
      new_arr.push(self[idx]) if !block.call(self[idx])
    end

    return new_arr
  end

  def my_any?(&block)

    0.upto(self.length - 1) do |idx|
      return true if block.call(self[idx])
    end

    return false
  end

  def my_all?(&block)

    0.upto(self.length - 1) do |idx|
      return false if !block.call(self[idx])
    end

    return true

  end

  def my_flatten
    result = []
    self.each do |idx|
      result += idx.my_flatten if idx.class == Array
      result << idx if idx.class != Array
    end

    return result
  end

  def my_zip(*args)
    result = []
    self.each_with_index do |el,idx|
      new_arr = []
      new_arr << el
      args.each do |el2|
        if el2[idx] == nil
          new_arr << nil
        else
          new_arr << el2[idx]
        end
      end

      result << new_arr
    end

    return result
  end

  def my_rotate(n = 1)
    new_arr = []

    self.each_with_index do |el, idx|
      new_arr << self[(idx+n) % 4]
    end

    return new_arr
  end

  def my_join(arg = "")
    result_arr = ""

    self.each do |el|
      result_arr += el + arg
    end

    if arg == ""
      return result_arr
    else
      return result_arr[0..-2]
    end
  end

  def my_reverse
    new_arr = []
    self.each { |el| new_arr.unshift(el)}
    return new_arr

  end
end
