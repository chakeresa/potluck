require 'minitest/autorun'
require 'minitest/pride'
require './lib/menu_generator'

class MenuGeneratorTest < Minitest::Test
  def setup
    potluck = Potluck.new("7-13-18")
    couscous_salad = Dish.new("Couscous Salad", :appetizer)
    summer_pizza = Dish.new("Summer Pizza", :appetizer)
    roast_pork = Dish.new("Roast Pork", :entre)
    cocktail_meatballs = Dish.new("Cocktail Meatballs", :entre)
    candy_salad = Dish.new("Candy Salad", :dessert)
    bean_dip = Dish.new("Bean Dip", :appetizer)

    potluck.add_dish(couscous_salad)
    potluck.add_dish(summer_pizza)
    potluck.add_dish(roast_pork)
    potluck.add_dish(cocktail_meatballs)
    potluck.add_dish(candy_salad)
    potluck.add_dish(bean_dip)

    @potluck = potluck
  end

  def test_it_exists
    menu_gen = MenuGenerator.new(@potluck)

    assert_instance_of MenuGenerator, menu_gen
  end

  def test_it_has_a_menu
    menu_gen = MenuGenerator.new(@potluck)

    assert_instance_of Hash, menu_gen.menu
    assert menu_gen.menu.keys.include?(:appetizers)
    assert_instance_of Array, menu_gen.menu[:appetizers]
  end
end
