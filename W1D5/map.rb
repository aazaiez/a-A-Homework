class Map
  attr_accessor :map

  def initialize
    @map = []
    end
  end

  def assign(key,value)
    @map.each do |el|
      el[1] = value if el[1] == key
    end
  end

  def lookup(key)
    result = 0
    @map.each do |el|
      result = el[1] if el[0] == key
    end
    result
  end

  def remove(k)
    map = map.select {|el| !el[0]==k }
  end

  def show
    deep_dup(@map)
  end

  private
  def deep_dep(arr)
    arr.map {|el| el.is_a?(Array) ? deep_dup(el) : el}
  end
end
