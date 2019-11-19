# Tool = Ruby
# Task = Model a Café
# Purpose = Practice OOD in Ruby
# Timebox = 30 Minutes

class Cafe
  attr_accessor :orders

  def initialize
    @orders = []
  end

  def coffees_to_make
    @orders.sum { |order| order.coffees_remaining }
  end

  def new_order
    @orders << CoffeeOrder.new
  end

  def coffee_made
    return if self.coffees_to_make == 0
    @orders.first.quantity_received += 1
    puts "Coffee up!"
    if @orders.first.complete?
      @orders.shift 
      puts "Order complete!"
    end
  end
end

class CoffeeOrder
  attr_reader :quantity_ordered
  attr_accessor :quantity_received

  def initialize
    @quantity_ordered = (0..5).to_a.sample
    puts "#{@quantity_ordered} coffees ordered"
    @quantity_received = 0
  end

  def coffees_remaining
    self.quantity_ordered - self.quantity_received
  end

  def complete?
    self.quantity_ordered == self.quantity_received
  end
end
