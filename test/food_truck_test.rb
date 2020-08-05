require 'minitest/autorun'
require 'minitest/pride'
require './lib/food_truck'
require './lib/item'

class FoodTruckTest < Minitest::Test
  def test_it_exists
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    assert_instance_of FoodTruck, food_truck
  end

  def test_it_has_readable_attributes
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    expected = {}
    assert_equal "Rocky Mountain Pies", food_truck.name
    assert_equal expected , food_truck.inventory
  end

  def test_it_can_stock_and_check_stock
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    assert_equal 0, food_truck.check_stock(item1)

    food_truck.stock(item1, 30)
    expected = {item1 => 30}

    assert_equal expected, food_truck.inventory

    food_truck.stock(item1, 25)
    expected = {item1 => 55}

    assert_equal expected, food_truck.inventory

    food_truck.stock(item2, 12)
    expected = {item1 => 55, item2 => 12}

    assert_equal expected, food_truck.inventory
  end
end
