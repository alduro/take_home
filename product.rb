require_relative 'tax'

class Product
  attr_reader :name, :price, :quantity

  def initialize(name, price, quantity)
    @name = name
    @price = price
    @quantity = quantity
  end

  def calculate_tax
    Tax.calculate(@name, @price)
  end

  def calculate_total
    @quantity * calculate_tax
  end

  def to_s
    "#{@quantity} #{@name}: #{calculate_total}"
  end
end

