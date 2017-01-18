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

end
