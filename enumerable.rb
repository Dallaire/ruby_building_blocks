module Enumerable
  def my_each
    for i in 0...self.length
      yield self[i]
    end
    return self
  end

  def my_each_with_index
    for i in 0...self.length
      yield self[i], i
    end
  end

  def my_select
    result=[]
    for i in 0...self.length
      if yield self[i]
        result.push(self[i])
      end
    end
    return result
  end

  def my_all?(&block)
    unless block_given?
      block= lambda {|x| x}
    end
    return my_select(&block).length == self.length
  end

  def my_any?(&block)
    unless block_given?
      block= lambda {|x| x}
    end
    return my_select(&block).length > 0
  end

  def my_none?(&block)
    unless block_given?
      block= lambda {|x| x}
    end
    return my_select(&block).length == 0
  end

  def my_count(num=nil, &block)
    unless num || block_given?
      return self.length
    end
    if num
      return self.my_select{|i| i==num}.length
    elsif block_given?
      return self.my_select(&block).length
    end
  end

  def my_map(p=nil)
    result=[]
    for i in 0...self.length
      result.push(p.call(self[i])) unless p==nil
      if block_given? && p==nil
        result.push(yield self[i])
      elsif !block_given? && p==nil
        return self.to_enum
      end
    end
    return result
  end

  def my_inject(initial=nil)
    if initial==nil
      accumulator=self[i]
    else
      accumulator=initial
    end
    self.my_each do |value|
      accumulator=yield(accumulator,value)
    end
    return accumulator
  end

    def multiply_els
      return self.my_inject(1){|product, value| product*value}
    end
end
