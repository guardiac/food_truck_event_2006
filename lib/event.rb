require 'date'

class Event
  attr_reader :name,
              :food_trucks,
              :date

  def initialize(name)
    @name = name
    @food_trucks = []
    @date = Date.today.strftime("%d/%m/%Y")
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map { |food_truck| food_truck.name }
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |food_truck|
      food_truck.inventory.keys.include?(item)
    end
  end

  def available_items
    @food_trucks.reduce([]) do |result, food_truck|
      result << food_truck.inventory.keys
      result
    end.flatten.uniq
  end

  def item_total_stock(item)
    food_trucks_that_sell(item).sum { |food_truck| food_truck.inventory[item] }
  end

  def total_inventory
    available_items.reduce({}) do |result, item|
      result[item] = {quantity: item_total_stock(item), food_trucks: food_trucks_that_sell(item)}
      result
    end
  end

  def overstocked_items
    available_items.reduce([]) do |result, item|
      result << item if item_total_stock(item) > 50 && food_trucks_that_sell(item).size > 1
      result
    end
  end

  def sorted_item_list
    available_items.map { |item| item.name }.sort
  end
end
