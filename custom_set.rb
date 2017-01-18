require 'pry'
class CustomSet
  attr_accessor :data
  def initialize(data)
    @data = data
  end

  def empty?
    data.empty?
  end

  def member?(element)
    data.include?(element)
  end

  def subset?(set2)
    return true if data.empty?
    return false if set2.data.empty?
    data.all? do |element|
      set2.data.include?(element)
    end
  end

  def disjoint?(set2)
    !data.any? do |element| # this is ugly
      set2.data.include?(element)
    end
  end

  def ==(set2)
    subset?(set2) && set2.subset?(self)
  end

  def add(element)
    data.push(element)
    self
  end

  def intersection(set2)
    inter = data.map do |element|
      set2.data.select {|element2| element == element2}
    end.flatten
    CustomSet.new(inter)
  end

  def difference(set2)
    diff = data - set2.data
    CustomSet.new(diff)
  end

  def union(set2)
    add = data + set2.data
    CustomSet.new(add.uniq)
  end

end
module BookKeeping
  VERSION = 1
end
