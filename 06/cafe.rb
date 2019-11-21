# Tool = Ruby
# Task = Model a Café
# Purpose = Practice OOD in Ruby
# Timebox = 30 Minutes

class Cafe
  attr_accessor :orders

  def initialize
    @orders = []
  end

  def coffees_to_make?
    orders.length > 0
  end

  def new_order
    @orders << CoffeeOrder.new
  end

  def coffee_made
    return unless self.coffees_to_make?
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
    @quantity_ordered = (1..5).to_a.sample
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

minutes = 8 * 60
coffee_making_time = 3
mission = Cafe.new
timeout = (10*rand()).floor
coffee_timeout = 11

minutes.times do |minute|
  if timeout < 1
    timeout = (10*rand()).floor
    mission.new_order
  end

  coffee_timeout = minute if mission.coffees_to_make?

  if (minute - coffee_timeout) % coffee_making_time == 0
    mission.coffee_made
  end
  timeout -= 1
end

puts mission.orders.sum { |order| order.coffees_remaining }
