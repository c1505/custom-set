require 'pry'
class CustomSet

  # should i include enumerable and define an each?
  attr_accessor :set
  def initialize(set)
    @set = set
  end

  def empty?
    set.empty?
  end

  def member?(element)
    set.include?(element)
  end

  def subset?(set2)
    return true if set.empty?
    return false if set2.set.empty?
    set.all? do |element|
      set2.set.include?(element)
    end
  end

  def disjoint?(set2)
    !set.any? do |element| # this is ugly
      set2.set.include?(element)
    end
  end

  def ==(set2)
    subset?(set2) && set2.subset?(self)
  end

  def add(element)
    set.push(element)
    self
  end

  def intersection(set2)
    inter = set.map do |element|
      set2.set.select {|element2| element == element2}
    end.flatten
    CustomSet.new(inter)
  end

  def difference(set2)
    diff = set - set2.set
    CustomSet.new(diff)
  end

  def union(set2)
    add = set + set2.set
    CustomSet.new(add.uniq)
  end

end
module BookKeeping
  VERSION = 1
end
