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

end
