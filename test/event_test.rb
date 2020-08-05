require 'minitest/autorun'
require 'minitest/pride'
require './lib/event'
require './lib/food_truck'
require './lib/item'

class EventTest < Minitest::Test
  def test_it_exists
    event = Event.new("South Pearl Street Farmers Market")

    assert_instance_of Event, event
  end

  def test_it_has_readable_attributes
    event = Event.new("South Pearl Street Farmers Market")

    assert_equal "South Pearl Street Farmers Market", event.name
    assert_equal [], event.food_trucks
  end
end
